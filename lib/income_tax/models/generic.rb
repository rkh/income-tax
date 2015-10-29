module IncomeTax
  module Models
    class Generic
      include Helpers
      extend  Helpers

      extend Forwardable
      def_delegators :rate, :to_f, :to_r, :to_d
      attr_reader :rate, :taxes, :gross_income, :net_income, :options

      def self.method_added(method)
        return super if self == Generic
        return super if superclass.method_defined? method
        superclass.protected_method_defined?(method) ? protected(method) : private(method)
        super
      end

      def self.name(value = nil)
        @name = value if value
        @name
      end

      def self.names
        @names ||= []
      end

      def self.other_names
        names.select { |n| n != name }
      end

      @register_on = CountryRegister
      def self.register_on(register = nil)
        @register_on = register if register
        @register_on ||= superclass.register_on
      end

      def self.register(*names)
        @name  ||= names.first
        self.names.concat(names)
        names.each { |name| register_on[name] = self }
      end

      @wants_options = []
      def self.wants_options(*options)
        @wants_options ||= superclass.wants_options.dup

        if options.any?
          @wants_options.concat(options)
          options.each do |option|
            define_method(option)       { @options[option] } unless method_defined? option
            define_method("#{option}?") { !!send(option)   } unless method_defined? "#{option}?"
          end
        end

        @wants_options
      end

      def self.currency(value = nil)
        @currency = value if value
        @currency
      end

      def self.lazy(&block)
        @lazy_mutex = Mutex.new
        @lazy = block
      end

      def self.new(*)
        if @lazy ||= nil
          @lazy_mutex.synchronize do
            if @lazy
              @lazy.call
              @lazy = nil
            end
          end
        end

        super
      end

      def initialize(income: 0, income_type: :gross, **options)
        raise ArgumentError, "income can't be negative" if income < 0
        @income_type = income_type
        @options     = options.dup

        set_default_options
        setup(income: income, income_type: income_type, **options)
        @options.freeze

        based_on?(:gross) ? set_gross_income(income) : set_net_income(income)
        cast_values
        validate
      end

      def setup(options)
      end

      def validate
        raise "gross income can't be negative" if gross_income < 0
        raise "net income can't be negative"   if net_income   < 0
        raise "taxes can't be negative"        if taxes        < 0

        # devide by two to avoid off by one errors
        if (net_income + taxes).to_i / 3 != gross_income.to_i / 3
          raise "net income and taxes don't add up to gross income. " \
            "%s + %s was expected to result in %s, gave %s" % [
              net_income, taxes, gross_income, net_income + taxes
            ]
        end

        # allow a 0.01% mismatch
        if taxes > 0 and (1.0 - Rate(taxes, gross_income) / rate).abs > 0.0001
          raise "tax rate does not give appropriate taxes. " \
            "%s of %s is %s, not %s" % [
              rate, gross_income, rate.gross_taxes(gross_income), taxes
            ]
        end
      end

      def set_default_options
        options[:married]    = false if options[:married].nil?
        options[:children]   = 0     if options[:children] == false
        options[:children] ||= options[:married] ? 1 : 0
        options[:age]      ||= age_for(options[:birthday]) if options[:birthday]
        options[:age]      ||= 30

        options.select! { |k,v| self.class.wants_options.include? k }

        options[:age]      &&= Integer(options[:age])
        options[:children] &&= Integer(options[:children])
      end

      def set_net_income(income)
        @net_income = income
        calculate_net

        if rate
          @taxes        ||= rate.net_taxes(net_income)
          @gross_income ||= rate.gross(net_income)
        elsif taxes
          @gross_income ||= net_income + taxes
          @rate         ||= Rate(taxes, gross_income)
        elsif gross_income
          @taxes        ||= gross_income - net_income
          @rate         ||= Rate(taxes, gross_income)
        else
          raise RuntimeError, "calculate_gross was expected to either set rate, taxes or net_income"
        end
      end

      def set_gross_income(income)
        @gross_income = income
        calculate_gross

        if rate
          @taxes      ||= rate.gross_taxes(gross_income)
          @net_income ||= rate.net(gross_income)
        elsif taxes
          @rate       ||= Rate(taxes, gross_income)
          @net_income ||= gross_income - taxes
        elsif net_income
          @taxes      ||= gross_income - net_income
          @rate       ||= Rate(taxes, gross_income)
        else
          raise RuntimeError, "calculate_gross was expected to either set rate, taxes or net_income"
        end
      end

      def based_on?(type)
        @income_type == type
      end

      def location_name
        self.class.name
      end

      def inspect
        net   = net_income   .is_a?(BigDecimal) ? net_income.to_s("F")   : net_income.to_s
        gross = gross_income .is_a?(BigDecimal) ? gross_income.to_s("F") : gross_income.to_s

        "#<IncomeTax:%p, rate: %p, net: %s, gross: %s>" % [
          location_name, rate.to_s, net, gross
        ]
      end

      def calculate_net
        calculate
      end

      def calculate_gross
        calculate
      end

      def calculate
        raise NotImplementedError
      end

      def cast_values
        @rate         = Rate(rate)
        @gross_income = cast_value(gross_income)
        @net_income   = cast_value(net_income)
        @taxes        = cast_value(taxes)
      end

      def cast_value(value)
        value == value.to_i ? value.to_i  : Rate.decimal(value)
      end

      private :calculate_net, :calculate_gross, :calculate, :set_net_income, :set_gross_income
    end
  end
end
