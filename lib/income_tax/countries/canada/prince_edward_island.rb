module IncomeTax
  module Countries
    class Canada
      class PrinceEdwardIsland < Territory
        register 'Prince Edward Island', 'PE'

        level offset(31_984), '9.8%'
        level offset(31_985), '13.8%'
        remainder '16.7%'
      end
    end
  end
end
