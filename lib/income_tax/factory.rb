module IncomeTax
  module Factory
    PATTERN = /^[€$£]?\d+(?:(?:\.\d)?[km])?(?:\/mo)?$/i
    MONEY   = -> o { defined? ::Money and o.is_a? Money }
    private_constant :PATTERN
    extend self

    def generate(*args, **options)
      parse_args(args,   options)
      set_income(:net,   options)
      set_income(:gross, options)

      location         = CountryRegister[options[:location] || options[:country] || no_country]
      options[:income] = parse_income(options[:income], location)
      location.new(options)
    end

    def parse_args(args, options)
      args.each do |arg|
        case arg
        when :gross, :net then options[:income_type] = arg
        when Numeric      then options[:income]      = arg
        when Symbol       then options[arg]          = true
        when PATTERN      then options[:income]      = arg
        when String       then options[:location]    = arg
        when MONEY        then options[:income]      = arg
        end
      end
    end

    def set_income(type, options)
      return unless options[type]
      options[:income]      = options.delete(type)
      options[:income_type] = type
    end

    def parse_income(value, location)
      case value
      when String
        month = false
        value = value.sub(/^[\$€£]/,  '')
        value = value.sub(/\/mo$/) { month = true; "" }
        value = value.sub(/\.(\d)m/i, '\100000')
        value = value.sub(/\.(\d)k/i, '\100')
        value = value.sub(/m/i,       '000000')
        value = value.sub(/k/i,       '000')
        value = value.to_i * 12 if month
        Integer(value)
      when MONEY
        value = value.exchange_to(location.currency)
        value.amount
      when Integer, BigDecimal
        value
      else
        value = Rate.decimal(value)
        value.to_i == value ? value.to_i : value
      end
    end

    def no_country
      raise ArgumentError, "no country name given"
    end

    private :parse_args, :parse_income, :set_income, :no_country
  end
end
