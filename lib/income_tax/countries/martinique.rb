module IncomeTax
  module Countries
    class Martinique < Models::Progressive
      register 'Martinique', 'MQ', 'MTQ'
      currency 'EUR'

      level 5687,  '0%'
      level 11_334, '5.5%'
      level 25_195, '14%'
      level 67_546, '30%'
      remainder '40%'
    end
  end
end
