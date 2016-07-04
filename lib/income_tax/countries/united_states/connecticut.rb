module IncomeTax
  module Countries
    class UnitedStates
      class Connecticut < State
        register 'Connecticut', 'CT'

        levels :single do
          standard_deduction = 14_000
          level standard_deduction + 0, '0.00%'
          level standard_deduction + 10_000,     '3.00%'
          level standard_deduction + 50_000,     '5.00%'
          level standard_deduction + 100_000,    '5.50%'
          level standard_deduction + 200_000,    '6.00%'
          level standard_deduction + 250_000,    '6.50%'
          remainder '6.70%'
        end

        levels :couple do
          standard_deduction = 24_000
          level standard_deduction + 0, '6.70%'
          level standard_deduction + 20_000,     '3.00%'
          level standard_deduction + 100_000,    '5.00%'
          level standard_deduction + 200_000,    '5.50%'
          level standard_deduction + 400_000,    '6.00%'
          level standard_deduction + 500_000,    '6.50%'
          remainder '6.70%'
        end
      end
    end
  end
end
