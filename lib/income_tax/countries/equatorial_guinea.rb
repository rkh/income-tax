module IncomeTax
  module Countries
    class EquatorialGuinea < Models::Progressive
      register 'Equatorial Guinea', 'GQ', 'GNQ'
      currency 'XAF'

      level  1_000_000, '0%'
      level  3_000_000, '10%'
      level  5_000_000, '15%'
      level 10_000_000, '20%'
      level 15_000_000, '25%'
      level 20_000_000, '30%'
      remainder         '35%'
    end
  end
end
