module IncomeTax
  module Countries
    class UnitedStates
      class Connecticut < State
        register "Connecticut", "CT"

        levels :single do
          standard_deduction = 14000
          level standard_deduction + 0,         "0.00%"
          level standard_deduction + 10000,     "3.00%"
          level standard_deduction + 50000,     "5.00%"
          level standard_deduction + 100000,    "5.50%"
          level standard_deduction + 200000,    "6.00%"
          level standard_deduction + 250000,    "6.50%"
          remainder                             "6.70%"
        end

        levels :couple do
          standard_deduction = 24000
          level standard_deduction + 0,         "6.70%"
          level standard_deduction + 20000,     "3.00%"
          level standard_deduction + 100000,    "5.00%"
          level standard_deduction + 200000,    "5.50%"
          level standard_deduction + 400000,    "6.00%"
          level standard_deduction + 500000,    "6.50%"
          remainder                             "6.70%"
        end
      end
    end
  end
end
