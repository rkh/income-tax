module IncomeTax
  module Countries
    class UnitedStates
      class California < State
        register 'California', 'CA'

        levels :single do
          standard_deduction = 3906
          level standard_deduction + 0,       '0%'
          level standard_deduction + 7582,    '1%'
          level standard_deduction + 17_976,   '2%'
          level standard_deduction + 28_371,   '4%'
          level standard_deduction + 39_384,   '6%'
          level standard_deduction + 49_774,   '8%'
          level standard_deduction + 254_250,  '9.3%'
          level standard_deduction + 305_100,  '10.3%'
          level standard_deduction + 508_500,  '11.3%'
          level standard_deduction + 1_000_000, '12.3%'
          remainder '13.3%'
        end

        levels :couple do
          standard_deduction = 7812
          level standard_deduction + 0, '0%'
          level standard_deduction + 15_174,   '1%'
          level standard_deduction + 35_952,   '2%'
          level standard_deduction + 46_346,   '4%'
          level standard_deduction + 57_359,   '6%'
          level standard_deduction + 67_751,   '8%'
          level standard_deduction + 345_780,  '9.3%'
          level standard_deduction + 414_936,  '10.3%'
          level standard_deduction + 691_560,  '11.3%'
          level standard_deduction + 1_000_000, '12.3%'
          remainder '13.3%'
        end
      end
    end
  end
end
