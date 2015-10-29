module IncomeTax
  module Models
    class Progressive < Generic
      class Levels
        include Helpers

        def initialize(levels = [], remainder = nil)
          @levels    = levels
          @remainder = remainder
        end

        def level(start, rate)
          @levels << [money(start), Rate(rate)]
        end

        def offset(delta)
          return delta unless @levels.any?
          @levels.last.first + money(delta)
        end

        def remainder(rate)
          @remainder = Rate(rate)
        end

        def +(rate)
          self.class.new(@levels.map { |b,r| [b, r + rate] }, @remainder + rate)
        end

        def multiply_brackets(factor)
          self.class.new(@levels.map { |b,r| [(b*factor).to_i, r] }, @remainder)
        end

        def calculate(method, income)
          remainder     = income
          already_taxed = 0
          taxes         = 0

          @levels.each do |boundary, rate|
            bracket       = boundary - already_taxed
            bracket       = yield rate, bracket if block_given?
            already_taxed = boundary

            if remainder > bracket
              taxes     += rate.public_send(method, bracket)
              remainder -= bracket
            else
              taxes     += rate.public_send(method, remainder)
              remainder  = 0
              break
            end
          end

          taxes + @remainder.public_send(method, remainder)
        end

        def calculate_gross(income)
          calculate(:gross_taxes, income)
        end

        def calculate_net(income)
          calculate(:net_taxes, income) { |rate, input| rate.net(input) }
        end
      end

      def self.level(start, rate)
        levels(:default).level(start, rate)
      end

      def self.offset(delta)
        levels(:default).offset(delta)
      end

      def self.remainder(rate)
        levels(:default).remainder(rate)
      end

      def self.levels(category = nil, *options, &block)
        return @levels ||= {} if category.nil?
        result = levels[category] ||= Levels.new(*options)
        result.instance_eval(&block) if block
        result
      end

      def level_category
        :default
      end

      def levels(category = level_category)
        self.class.levels.fetch(category) do
          raise ArgumentError, "unkown level category #{category} (available: #{self.class.levels.keys.join(", ")})"
        end
      end

      def calculate_gross
        @taxes = levels.calculate_gross(gross_income)
      end

      def calculate_net
        @taxes = levels.calculate_net(net_income)
      end
    end
  end
end
