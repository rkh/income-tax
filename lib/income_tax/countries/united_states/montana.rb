module IncomeTax
  module Countries
    class UnitedStates
      class Montana < State
        register "Montana", "MT"
        deduct_federal

        levels :single do
          standard_deduction = 2280
          level standard_deduction + 0,         "0.00%"
          level standard_deduction + 2800,      "1%"
          level standard_deduction + 4900,      "2%"
          level standard_deduction + 7400,      "3%"
          level standard_deduction + 10100,     "4%"
          level standard_deduction + 13000,     "5%"
          level standard_deduction + 16700,     "6%"
          remainder                             "6.9%"
        end

        levels :couple do
          standard_deduction = 2280
          level standard_deduction + 0,         "6.9%"
          level standard_deduction + 2800,      "1%"
          level standard_deduction + 4900,      "2%"
          level standard_deduction + 7400,      "3%"
          level standard_deduction + 10100,     "4%"
          level standard_deduction + 13000,     "5%"
          level standard_deduction + 16700,     "6%"
          remainder                             "6.9%"
        end
      end
    end
  end
end
