module IncomeTax
  module Countries
    class UnitedStates
      class NorthDakota < State
        register 'North Dakota', 'ND'

        standard_deduction = 3900
        level standard_deduction + 0, '3.22%'
        level standard_deduction + 73_800,     '1.22%'
        level standard_deduction + 148_850,    '2.27%'
        level standard_deduction + 226_850,    '2.52%'
        level standard_deduction + 405_100,    '2.93%'
        remainder '3.22%'
      end
    end
  end
end
