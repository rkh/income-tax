module IncomeTax
  module Countries
    class Laos < Models::Progressive
      register "Lao People's Democratic Republic", 'Laos', 'LA', 'LAO'
      currency 'LAK'

      level    300_000, '0%'
      level  1_500_000, '5%'
      level  4_000_000, '10%'
      level  8_000_000, '15%'
      level 20_000_000, '20%'
      remainder         '25%'
    end
  end
end
