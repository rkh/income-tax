module IncomeTax
  module Countries
    class UnitedStates
      class NewJersey < State
        register "New Jersey", "NJ"

        levels :single do
          standard_deduction = 1000
          level standard_deduction + 0,         "0.00%"
          level standard_deduction + 20000,     "1.4%"
          level standard_deduction + 35000,     "1.75%"
          level standard_deduction + 40000,     "3.5%"
          level standard_deduction + 75000,     "5.525%"
          level standard_deduction + 500000,    "6.37%"
          remainder                             "8.97%"
        end

        levels :couple do
          standard_deduction = 1000
          level standard_deduction + 0,         "8.97%"
          level standard_deduction + 20000,     "1.40%"
          level standard_deduction + 50000,     "1.75%"
          level standard_deduction + 70000,     "2.45%"
          level standard_deduction + 80000,     "3.50%"
          level standard_deduction + 150000,    "5.525%"
          level standard_deduction + 500000,    "6.37%"
          remainder                             "8.97%"
        end
      end
    end
  end
end
