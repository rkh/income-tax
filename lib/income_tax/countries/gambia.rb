module IncomeTax
  module Countries
    class Gambia < Models::Progressive
      register 'Gambia', 'GM', 'GMB'
      currency 'GMD'

      level 18_000, '0%'
      level 28_000, '5%'
      level 38_000, '10%'
      level 48_000, '15%'
      level 58_000, '20%'
      remainder '30%'
    end
  end
end
