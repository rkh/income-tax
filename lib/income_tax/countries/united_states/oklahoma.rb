module IncomeTax
  module Countries
    class UnitedStates
      class Oklahoma < State
        register "Oklahoma", "OK"

        levels :single do
          standard_deduction = 1000
          level standard_deduction + 0,         "0.00%"
          level standard_deduction + 1000,      "0.5%"
          level standard_deduction + 2500,      "1%"
          level standard_deduction + 3750,      "2%"
          level standard_deduction + 4900,      "3%"
          level standard_deduction + 7200,      "4%"
          level standard_deduction + 8700,      "5%"
          remainder                             "5.25%"
        end

        levels :couple do
          standard_deduction = 1000
          level standard_deduction + 0,         "5.25%"
          level standard_deduction + 2000,      "0.5%"
          level standard_deduction + 5000,      "1%"
          level standard_deduction + 7500,      "2%"
          level standard_deduction + 9800,      "3%"
          level standard_deduction + 12200,     "4%"
          level standard_deduction + 15000,     "5%"
          remainder                             "5.25%"
        end
      end
    end
  end
end
