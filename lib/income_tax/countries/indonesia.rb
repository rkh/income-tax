module IncomeTax
  module Countries
    class Indonesia < Models::Progressive
      register 'Indonesia', 'ID', 'IDN'
      currency 'IDR'

      level  24_000_000, '0%'
      level  50_000_000, '5%'
      level 250_000_000, '15%'
      level 500_000_000, '25%'
      remainder          '30%'
    end
  end
end
