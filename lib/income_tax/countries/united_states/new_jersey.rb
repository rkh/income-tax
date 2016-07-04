module IncomeTax
  module Countries
    class UnitedStates
      class NewJersey < State
        register 'New Jersey', 'NJ'

        levels :single do
          standard_deduction = 1000
          level standard_deduction + 0, '0.00%'
          level standard_deduction + 20_000,     '1.4%'
          level standard_deduction + 35_000,     '1.75%'
          level standard_deduction + 40_000,     '3.5%'
          level standard_deduction + 75_000,     '5.525%'
          level standard_deduction + 500_000,    '6.37%'
          remainder '8.97%'
        end

        levels :couple do
          standard_deduction = 1000
          level standard_deduction + 0, '8.97%'
          level standard_deduction + 20_000,     '1.40%'
          level standard_deduction + 50_000,     '1.75%'
          level standard_deduction + 70_000,     '2.45%'
          level standard_deduction + 80_000,     '3.50%'
          level standard_deduction + 150_000,    '5.525%'
          level standard_deduction + 500_000,    '6.37%'
          remainder '8.97%'
        end
      end
    end
  end
end
