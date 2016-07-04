module IncomeTax
  module Countries
    class Canada
      class NewBrunswick < Territory
        register 'New Brunswick', 'NB'

        level offset(40_492),  '9.68%'
        level offset(40_493),  '14.82%'
        level offset(50_679),  '16.52%'
        level offset(18_336),  '17.84%'
        level offset(100_000), '21%'
        remainder '25.75%'
      end
    end
  end
end
