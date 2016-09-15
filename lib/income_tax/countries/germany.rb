module IncomeTax
  module Countries
    class Germany < Models::Generic
      register 'Germany', 'DE', 'DEU'
      currency 'EUR'

      wants_options :married
      SOLIDARITY = Rate('5.5%')

      def self.parse_line(line)
        line.chomp.split("\t").map do |entry|
          next 1 / 0.0 if entry == '–'
          entry.include?('.') ? Rational(entry) : Integer(entry)
        end
      end

      def self.load_rates(path)
        File.read(path).lines[1..-1].each do |line|
          year, e0, e1, e2, e3, s1, s2, s3, a1, b1, a2, b2, b3, b4 = parse_line(line)
          e4 = 1 / 0.0

          tax_years[year] = [
            [0,      e0, 0, Rate('0%'), Rate('0%')],
            [e0 + 1,   e1, 0,  Rate(b1),   Rate((a1 * (e1 - e0) / 10_000 + b1 * 10_000) / 10_000)],
            [e1 + 1,   e2, s1, Rate(b2),   Rate((a2 * (e2 - e1) / 10_000 + b2 * 10_000) / 10_000)],
            [e2 + 1,   e3, s2, Rate(b3),   Rate(b3)],
            [e3 + 1,   e4, s3, Rate(b4),   Rate(b4)]
          ]
        end
      end

      def self.tax_years
        @tax_years ||= {}
      end

      def self.first_year
        @first_year ||= tax_years.to_a.first.first
      end

      def self.tax_year(year)
        year = first_year if year < first_year
        tax_years[year] || tax_year(year - 1)
      end

      def zones
        @zones ||= self.class.tax_year(tax_year)
      end

      def net_taxes(income, lower, upper, lower_taxes, lower_rate, upper_rate, upper_taxes)
        lower_income = lower - lower_taxes
        upper_income = upper - upper_taxes
        steps        = income - lower_income

        if upper_rate > lower_rate
          step = (upper_rate - lower_rate) / (upper_income - lower_income)
          rate = lower_rate + Rate(step * steps)
        else
          rate = lower_rate
        end

        rate.net_taxes(steps).to_i + lower_taxes
      end

      def for_range(value)
        value.to_f.nan? ? 1 / 0.0 : value
      end

      def calculate_net
        income  = net_income.to_i
        income /= 2 if married?

        case income
        when 0..for_range(zones[0][1])               then @taxes = 0
        when 0..for_range(zones[1][1] - zones[2][2]) then @taxes = net_taxes(income, *zones[1], zones[2][2])
        when 0..for_range(zones[2][1] - zones[3][2]) then @taxes = net_taxes(income, *zones[2], zones[3][2])
        when 0..for_range(zones[3][1] - zones[4][2]) then @taxes = net_taxes(income, *zones[3], zones[4][2])
        else @taxes = net_taxes(income, *zones[4], zones[4][2])
        end

        @taxes *= 2 if married?
        @taxes += SOLIDARITY.net_taxes(income)
      end

      def calculate_gross
        income  = gross_income.to_i
        income /= 2 if married?

        lower, upper, fixed, lower_rate, upper_rate = zones.detect { |l, u, *| income.between?(l, u) }
        step   = (upper_rate - lower_rate) / (upper - lower + 1)
        steps  = (income - lower + 1)
        rate   = lower_rate + Rate(step * steps)
        @taxes = rate.gross_taxes(steps).to_i + fixed

        @taxes *= 2 if married?
        @taxes += SOLIDARITY.gross_taxes(@taxes)
      end

      load_rates "#{__dir__}/germany/rates.tsv"
    end
  end
end
