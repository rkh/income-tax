module IncomeTax
  module Countries
    class UnitedStates
      class Mississippi < State
        register 'Mississippi', 'MS'

        levels :single do
          standard_deduction = 6000
          level standard_deduction + 0,         '0.00%'
          level standard_deduction + 5000,      '3%'
          level standard_deduction + 10_000, '4%'
          remainder '5%'
        end

        levels :couple do
          standard_deduction = 12_000
          level standard_deduction + 0,         '5%'
          level standard_deduction + 5000,      '3%'
          level standard_deduction + 10_000, '4%'
          remainder '5%'
        end
      end
    end
  end
end
