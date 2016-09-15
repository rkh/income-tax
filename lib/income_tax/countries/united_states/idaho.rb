module IncomeTax
  module Countries
    class UnitedStates
      class Idaho < State
        register 'Idaho', 'ID'

        levels :single do
          standard_deduction = 3900
          level standard_deduction + 0,         '0.00%'
          level standard_deduction + 1408,      '1.6%'
          level standard_deduction + 2817,      '3.6%'
          level standard_deduction + 4226,      '4.1%'
          level standard_deduction + 5635,      '5.1%'
          level standard_deduction + 7044,      '6.1%'
          level standard_deduction + 10_567, '7.1%'
          remainder '7.4%'
        end

        levels :couple do
          standard_deduction = 3900
          level standard_deduction + 0,         '7.4%'
          level standard_deduction + 2817,      '1.6%'
          level standard_deduction + 5635,      '3.6%'
          level standard_deduction + 8453,      '4.1%'
          level standard_deduction + 11_271,     '5.1%'
          level standard_deduction + 14_089,     '6.1%'
          level standard_deduction + 21_136,     '7.1%'
          remainder '7.4%'
        end
      end
    end
  end
end
