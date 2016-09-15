module IncomeTax
  module Countries
    class UnitedStates
      class RhodeIsland < State
        register 'Rhode Island', 'RI'

        levels :single do
          standard_deduction = 3800
          level standard_deduction + 0, '0.00%'
          level standard_deduction + 59_600,     '3.75%'
          level standard_deduction + 135_500,    '4.75%'
          remainder '5.99%'
        end

        levels :couple do
          standard_deduction = 3800
          level standard_deduction + 0, '5.99%'
          level standard_deduction + 59_600,     '3.75%'
          level standard_deduction + 135_500,    '4.75%'
          remainder '5.99%'
        end
      end
    end
  end
end
