module IncomeTax
  module Countries
    class UnitedStates
      class Kentucky < State
        register 'Kentucky', 'KY'

        levels :single do
          standard_deduction = 20
          level standard_deduction + 0,         '0.00%'
          level standard_deduction + 3000,      '2%'
          level standard_deduction + 4000,      '3%'
          level standard_deduction + 5000,      '4%'
          level standard_deduction + 8000,      '5%'
          level standard_deduction + 75_000, '5.8%'
          remainder '6%'
        end

        levels :couple do
          standard_deduction = 20
          level standard_deduction + 0,         '6%'
          level standard_deduction + 3000,      '2%'
          level standard_deduction + 4000,      '3%'
          level standard_deduction + 5000,      '4%'
          level standard_deduction + 8000,      '5%'
          level standard_deduction + 75_000, '5.8%'
          remainder '6%'
        end
      end
    end
  end
end
