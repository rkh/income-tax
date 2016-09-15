module IncomeTax
  module Countries
    class UnitedStates
      class Maryland < State
        register 'Maryland', 'MD'

        levels :single do
          standard_deduction = 3200
          level standard_deduction + 0,         '0.00%'
          level standard_deduction + 1000,      '2%'
          level standard_deduction + 2000,      '3%'
          level standard_deduction + 3000,      '4%'
          level standard_deduction + 100_000,    '4.75%'
          level standard_deduction + 125_000,    '5%'
          level standard_deduction + 150_000,    '5.25%'
          level standard_deduction + 250_000,    '5.5%'
          remainder '5.75%'
        end

        levels :couple do
          standard_deduction = 3200
          level standard_deduction + 0,         '5.75%'
          level standard_deduction + 1000,      '2%'
          level standard_deduction + 2000,      '3%'
          level standard_deduction + 3000,      '4%'
          level standard_deduction + 150_000,    '4.75%'
          level standard_deduction + 175_000,    '5%'
          level standard_deduction + 225_000,    '5.25%'
          level standard_deduction + 300_000,    '5.5%'
          remainder '5.75%'
        end
      end
    end
  end
end
