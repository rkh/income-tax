module IncomeTax
  module Countries
    class UnitedStates
      class Hawaii < State
        register 'Hawaii', 'HI'

        levels :single do
          standard_deduction = 1144
          level standard_deduction + 0,         '0.00%'
          level standard_deduction + 2400,      '1.4%'
          level standard_deduction + 4800,      '3.2%'
          level standard_deduction + 9600,      '5.5%'
          level standard_deduction + 14_400,     '6.4%'
          level standard_deduction + 19_200,     '6.8%'
          level standard_deduction + 24_000,     '7.2%'
          level standard_deduction + 36_000,     '7.6%'
          level standard_deduction + 48_000,     '7.9%'
          level standard_deduction + 150_000,    '8.25%'
          level standard_deduction + 175_000,    '9%'
          level standard_deduction + 200_000,    '10%'
          remainder '11%'
        end

        levels :couple do
          standard_deduction = 1144
          level standard_deduction + 0,         '11%'
          level standard_deduction + 4800,      '1.4%'
          level standard_deduction + 9600,      '3.2%'
          level standard_deduction + 19_200,     '5.5%'
          level standard_deduction + 28_800,     '6.4%'
          level standard_deduction + 38_400,     '6.8%'
          level standard_deduction + 48_000,     '7.2%'
          level standard_deduction + 72_000,     '7.6%'
          level standard_deduction + 96_000,     '7.9%'
          level standard_deduction + 300_000,    '8.25%'
          level standard_deduction + 350_000,    '9%'
          level standard_deduction + 400_000,    '10%'
          remainder '11%'
        end
      end
    end
  end
end
