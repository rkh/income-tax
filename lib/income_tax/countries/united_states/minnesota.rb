module IncomeTax
  module Countries
    class UnitedStates
      class Minnesota < State
        register 'Minnesota', 'MN'

        levels :single do
          standard_deduction = 3900
          level standard_deduction + 0, '0.00%'
          level standard_deduction + 24_680,     '5.35%'
          level standard_deduction + 81_080,     '7.05%'
          level standard_deduction + 152_540,    '7.85%'
          remainder '9.85%'
        end

        levels :couple do
          standard_deduction = 3900
          level standard_deduction + 0, '9.85%'
          level standard_deduction + 36_080,     '5.35%'
          level standard_deduction + 143_350,    '7.05%'
          level standard_deduction + 254_240,    '7.85%'
          remainder '9.85%'
        end
      end
    end
  end
end
