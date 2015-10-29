module IncomeTax
  module Countries
    class UnitedStates
      class NewMexico < State
        register "New Mexico", "NM"

        levels :single do
          standard_deduction = 3900
          level standard_deduction + 0,         "0.00%"
          level standard_deduction + 5500,      "1.7%"
          level standard_deduction + 11000,     "3.2%"
          level standard_deduction + 16000,     "4.7%"
          remainder                             "4.9%"
        end

        levels :couple do
          standard_deduction = 3900
          level standard_deduction + 0,         "4.9%"
          level standard_deduction + 8000,      "1.7%"
          level standard_deduction + 16000,     "3.2%"
          level standard_deduction + 24000,     "4.7%"
          remainder                             "4.9%"
        end
      end
    end
  end
end
