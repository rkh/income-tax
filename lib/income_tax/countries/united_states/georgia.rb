module IncomeTax
  module Countries
    class UnitedStates
      class Georgia < State
        register "Georgia", "GA"

        levels :single do
          standard_deduction = 2700
          level standard_deduction + 0,         "0.00%"
          level standard_deduction + 750,       "1%"
          level standard_deduction + 2250,      "2%"
          level standard_deduction + 3750,      "3%"
          level standard_deduction + 5250,      "4%"
          level standard_deduction + 7000,      "5%"
          remainder                             "6%"
        end

        levels :couple do
          standard_deduction = 7400
          level standard_deduction + 0,         "6%"
          level standard_deduction + 1000,      "1%"
          level standard_deduction + 3000,      "2%"
          level standard_deduction + 5000,      "3%"
          level standard_deduction + 7000,      "4%"
          level standard_deduction + 10000,     "5%"
          remainder                             "6%"
        end

      end
    end
  end
end
