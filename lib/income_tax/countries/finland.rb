module IncomeTax
  module Countries
    class Finland < Models::Progressive
      register 'Finland', 'FI', 'FIN'
      currency 'EUR'

      level 15_600, '0%'
      level 23_200, '6.5%'
      level 37_800, '17.5%'
      level 68_200, '21.5%'
      remainder '30%'
    end
  end
end
