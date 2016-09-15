module IncomeTax
  module Countries
    class UnitedStates
      class NewYork < State
        register 'New York', 'NY'

        levels :single do
          standard_deduction = 7700
          level standard_deduction + 0,         '0.00%'
          level standard_deduction + 8200,      '4%'
          level standard_deduction + 11_300,     '4.5%'
          level standard_deduction + 13_350,     '5.25%'
          level standard_deduction + 20_550,     '5.9%'
          level standard_deduction + 77_150,     '6.45%'
          level standard_deduction + 205_850,    '6.65%'
          level standard_deduction + 1_029_250, '6.85%'
          remainder '8.82%'
        end

        levels :couple do
          standard_deduction = 15_400
          level standard_deduction + 0, '8.82%'
          level standard_deduction + 16_450,     '4%'
          level standard_deduction + 22_600,     '4.5%'
          level standard_deduction + 26_750,     '5.25%'
          level standard_deduction + 41_150,     '5.9%'
          level standard_deduction + 154_350,    '6.45%'
          level standard_deduction + 308_750,    '6.65%'
          level standard_deduction + 2_058_550, '6.85%'
          remainder '8.82%'
        end
      end
    end
  end
end
