module IncomeTax
  module Countries
    class Comoros < Models::Progressive
      register 'Comoros', 'KM', 'COM'
      currency 'KMF'

      level 150_000,  '0%'
      level 500_000,  '5%'
      level 1_000_000, '10%'
      level 1_500_000, '15%'
      level 2_500_000, '20%'
      level 3_500_000, '25%'
      remainder '30%'
    end
  end
end
