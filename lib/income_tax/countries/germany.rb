module IncomeTax
  module Countries
    class Germany < Models::Generic
      register "Germany", "DE", "DEU"
      currency "EUR"

      wants_options :married

      infinity = 1/0.0
      ZONES    = [
        [ 0,      8472,     0,             Rate("0%"),     Rate("0%")                                                 ],
        [ 8473,   13469,    0,             Rate("14%"),    Rate((997.6r  * (13469 - 8472)  / 10_000 + 1400) / 10_000) ],
        [ 13470,  52881,    "948.68".to_d, Rate("23.97%"), Rate((228.74r * (52881 - 13469) / 10_000 + 2397) / 10_000) ],
        [ 52882,  250730,   13949,         Rate("42%"),    Rate("42%")                                                ],
        [ 250731, infinity, 97045,         Rate("45%"),    Rate("45%")                                                ]
      ]

      SOLIDARITY = Rate("5.5%")

      def net_taxes(income, lower, upper, lower_taxes, lower_rate, upper_rate, upper_taxes)
        lower_income = lower - lower_taxes
        upper_income = upper - upper_taxes
        step         = (upper_rate - lower_rate) / (upper_income - lower_income)
        steps        = income - lower_income
        rate         = lower_rate + Rate(step * steps)
        rate.net_taxes(steps).to_i + lower_taxes
      end

      def calculate_net
        income  = net_income.to_i
        income /= 2 if married?

        case income
        when 0 .. ZONES[0][1]               then @taxes = 0
        when 0 .. ZONES[1][1] - ZONES[2][2] then @taxes = net_taxes(income, *ZONES[1], ZONES[2][2])
        when 0 .. ZONES[2][1] - ZONES[3][2] then @taxes = net_taxes(income, *ZONES[2], ZONES[3][2])
        when 0 .. ZONES[3][1] - ZONES[4][2] then @taxes = net_taxes(income, *ZONES[3], ZONES[4][2])
        else                                     @taxes = net_taxes(income, *ZONES[4], ZONES[4][2])
        end

        @taxes *= 2 if married?
        @taxes += SOLIDARITY.net_taxes(income)
      end

      def calculate_gross
        income  = gross_income.to_i
        income /= 2 if married?

        lower, upper, fixed, lower_rate, upper_rate = ZONES.detect { |l,u,*| income.between?(l,u) }
        step   = (upper_rate - lower_rate) / (upper - lower + 1)
        steps  = (income - lower + 1)
        rate   = lower_rate + Rate(step * steps)
        @taxes = rate.gross_taxes(steps).to_i + fixed

        @taxes *= 2 if married?
        @taxes += SOLIDARITY.gross_taxes(@taxes)
      end
    end
  end
end
