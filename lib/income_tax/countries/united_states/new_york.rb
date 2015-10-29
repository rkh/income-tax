module IncomeTax
  module Countries
    class UnitedStates
      class NewYork < State
        register "New York", "NY"

        levels :single do
          standard_deduction = 7700
          level standard_deduction + 0,         "0.00%"
          level standard_deduction + 8200,      "4%"
          level standard_deduction + 11300,     "4.5%"
          level standard_deduction + 13350,     "5.25%"
          level standard_deduction + 20550,     "5.9%"
          level standard_deduction + 77150,     "6.45%"
          level standard_deduction + 205850,    "6.65%"
          level standard_deduction + 1029250,   "6.85%"
          remainder                             "8.82%"
        end

        levels :couple do
          standard_deduction = 15400
          level standard_deduction + 0,         "8.82%"
          level standard_deduction + 16450,     "4%"
          level standard_deduction + 22600,     "4.5%"
          level standard_deduction + 26750,     "5.25%"
          level standard_deduction + 41150,     "5.9%"
          level standard_deduction + 154350,    "6.45%"
          level standard_deduction + 308750,    "6.65%"
          level standard_deduction + 2058550,   "6.85%"
          remainder                             "8.82%"
        end
      end
    end
  end
end
