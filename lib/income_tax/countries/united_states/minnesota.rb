module IncomeTax
  module Countries
    class UnitedStates
      class Minnesota < State
        register "Minnesota", "MN"

        levels :single do
          standard_deduction = 3900
          level standard_deduction + 0,         "0.00%"
          level standard_deduction + 24680,     "5.35%"
          level standard_deduction + 81080,     "7.05%"
          level standard_deduction + 152540,    "7.85%"
          remainder                             "9.85%"
        end

        levels :couple do
          standard_deduction = 3900
          level standard_deduction + 0,         "9.85%"
          level standard_deduction + 36080,     "5.35%"
          level standard_deduction + 143350,    "7.05%"
          level standard_deduction + 254240,    "7.85%"
          remainder                             "9.85%"
        end
      end
    end
  end
end
