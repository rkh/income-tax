module IncomeTax
  module Countries
    class UnitedStates
      class WestVirginia < State
        register 'West Virginia', 'WV'

        levels :single do
          standard_deduction = 2000
          level standard_deduction + 0, '0.00%'
          level standard_deduction + 10_000,     '3%'
          level standard_deduction + 25_000,     '4%'
          level standard_deduction + 40_000,     '4.5%'
          level standard_deduction + 60_000,     '6%'
          remainder '6.5%'
        end

        levels :couple do
          standard_deduction = 2000
          level standard_deduction + 0, '6.5%'
          level standard_deduction + 10_000,     '3%'
          level standard_deduction + 25_000,     '4%'
          level standard_deduction + 40_000,     '4.5%'
          level standard_deduction + 60_000,     '6%'
          remainder '6.5%'
        end
      end
    end
  end
end
