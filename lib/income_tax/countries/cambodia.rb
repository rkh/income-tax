module IncomeTax
  module Countries
    class Cambodia < Models::Progressive
      register 'Cambodia', 'KH', 'KHM'
      currency 'KHR'

      level 500_000, '0%'
      level 1_250_000,  '5%'
      level 8_500_000,  '10%'
      level 12_500_000, '15%'
      remainder '20%'
    end
  end
end
