module IncomeTax
  module Countries
    class UnitedStates
      class Missouri < State
        register 'Missouri', 'MO'
        deduct_federal

        levels :single do
          standard_deduction = 2100
          level standard_deduction + 0,         '0.00%'
          level standard_deduction + 1000,      '1.5%'
          level standard_deduction + 2000,      '2%'
          level standard_deduction + 3000,      '2.5%'
          level standard_deduction + 4000,      '3%'
          level standard_deduction + 5000,      '3.5%'
          level standard_deduction + 6000,      '4%'
          level standard_deduction + 7000,      '4.5%'
          level standard_deduction + 8000,      '5%'
          level standard_deduction + 9000,      '5.5%'
          remainder                             '6%'
        end

        levels :couple do
          standard_deduction = 4200
          level standard_deduction + 0,         '6%'
          level standard_deduction + 1000,      '1.5%'
          level standard_deduction + 2000,      '2%'
          level standard_deduction + 3000,      '2.5%'
          level standard_deduction + 4000,      '3%'
          level standard_deduction + 5000,      '3.5%'
          level standard_deduction + 6000,      '4%'
          level standard_deduction + 7000,      '4.5%'
          level standard_deduction + 8000,      '5%'
          level standard_deduction + 9000,      '5.5%'
          remainder                             '6%'
        end
      end
    end
  end
end
