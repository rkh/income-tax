module IncomeTax
  module Countries
    class Gibraltar < Models::Progressive
      register 'Gibraltar', 'GI', 'GIB'
      currency 'GIP'

      level    10_000, '8%'
      level    25_000, '20%'
      level   353_000, '29%'
      level   704_800, '20%'
      level 1_000_000, '10%'
      remainder        '5%'
    end
  end
end
