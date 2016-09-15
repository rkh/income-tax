module IncomeTax
  module Countries
    class UnitedStates
      class Iowa < State
        register 'Iowa', 'IA'
        deduct_federal

        levels :single do
          standard_deduction = 40
          level standard_deduction + 0,         '0.00%'
          level standard_deduction + 1515,      '0.36%'
          level standard_deduction + 3030,      '0.72%'
          level standard_deduction + 6060,      '2.43%'
          level standard_deduction + 13_635,     '4.50%'
          level standard_deduction + 22_725,     '6.12%'
          level standard_deduction + 30_300,     '6.48%'
          level standard_deduction + 45_450,     '6.80%'
          level standard_deduction + 68_175,     '7.92%'
          remainder '8.98%'
        end

        levels :couple do
          standard_deduction = 40
          level standard_deduction + 0,         '8.98%'
          level standard_deduction + 1515,      '0.36%'
          level standard_deduction + 3030,      '0.72%'
          level standard_deduction + 6060,      '2.43%'
          level standard_deduction + 13_635,     '4.50%'
          level standard_deduction + 22_725,     '6.12%'
          level standard_deduction + 30_300,     '6.48%'
          level standard_deduction + 45_450,     '6.80%'
          level standard_deduction + 68_175,     '7.92%'
          remainder '8.98%'
        end
      end
    end
  end
end
