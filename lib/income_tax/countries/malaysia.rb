module IncomeTax
  module Countries
    class Malaysia < Models::Progressive
      register 'Malaysia', 'MY', 'MYS'
      currency 'MYR'

      level 5_000, '0%'
      level  20_000, '1%'
      level  35_000, '5%'
      level  50_000, '10%'
      level  70_000, '16%'
      level 100_000, '21%'
      level 250_000, '24%'
      level 400_000, '24.5%'
      remainder      '25%'
    end
  end
end
