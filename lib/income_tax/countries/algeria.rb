module IncomeTax
  module Countries
    class Algeria < Models::Progressive
      register 'Algeria', 'DZ', 'DZA'
      currency 'DZD'

      level   120_000, '0%'
      level   360_000, '20%'
      level 1_440_000, '30%'
      remainder        '35%'
    end
  end
end
