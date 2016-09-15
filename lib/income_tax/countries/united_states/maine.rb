module IncomeTax
  module Countries
    class UnitedStates
      class Maine < State
        register 'Maine', 'ME'

        levels :single do
          standard_deduction = 3900
          level standard_deduction + 5200, '0.00%'
          level standard_deduction + 20_900, '6.50%'
          remainder '7.95%'
        end

        levels :couple do
          standard_deduction = 3900
          level standard_deduction + 10_450,     '7.95%'
          level standard_deduction + 41_850,     '6.50%'
          remainder '7.95%'
        end
      end
    end
  end
end
