module IncomeTax
  module Countries
    class UnitedStates
      class Louisiana < State
        register "Louisiana", "LA"
        deduct_federal

        levels :single do
          standard_deduction = 4500
          level standard_deduction + 0,         "0.00%"
          level standard_deduction + 12500,     "2%"
          level standard_deduction + 50000,     "4%"
          remainder                             "6%"
        end

        levels :couple do
          standard_deduction = 9000
          level standard_deduction + 0,         "6%"
          level standard_deduction + 25000,     "2%"
          level standard_deduction + 100000,    "4%"
          remainder                             "6%"
        end
      end
    end
  end
end
