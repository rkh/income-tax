module IncomeTax
  module Countries
    class UnitedStates
      class Delaware < State
        register "Delaware", "DE"

        levels :single do
          standard_deduction = 110
          level standard_deduction + 2000,      "0.00%"
          level standard_deduction + 5000,      "2.2%"
          level standard_deduction + 10000,     "3.9%"
          level standard_deduction + 20000,     "4.8%"
          level standard_deduction + 25000,     "5.2%"
          level standard_deduction + 60000,     "5.55%"
          remainder                             "6.60%"
        end

        levels :couple do
          standard_deduction = 110
          level standard_deduction + 2000,      "6.60%"
          level standard_deduction + 5000,      "2.2%"
          level standard_deduction + 10000,     "3.9%"
          level standard_deduction + 20000,     "4.8%"
          level standard_deduction + 25000,     "5.2%"
          level standard_deduction + 60000,     "5.55%"
          remainder                             "6.60%"
        end
      end
    end
  end
end
