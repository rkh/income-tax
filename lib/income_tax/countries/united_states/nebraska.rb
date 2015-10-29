module IncomeTax
  module Countries
    class UnitedStates
      class Nebraska < State
        register "Nebraska", "NE"

        levels :single do
          standard_deduction = 126
          level standard_deduction + 0,         "0.00%"
          level standard_deduction + 3000,      "2.46%"
          level standard_deduction + 18000,     "3.51%"
          level standard_deduction + 29000,     "5.01%"
          remainder                             "6.84%"
        end

        levels :couple do
          standard_deduction = 126
          level standard_deduction + 0,         "6.84%"
          level standard_deduction + 6000,      "2.46%"
          level standard_deduction + 36000,     "3.51%"
          level standard_deduction + 58000,     "5.01%"
          remainder                             "6.84%"
        end
      end
    end
  end
end
