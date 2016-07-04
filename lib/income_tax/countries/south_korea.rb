module IncomeTax
  module Countries
    class SouthKorea < Models::Progressive
      register 'South Korea', 'Korea (South)', 'Republic of Korea', 'Korea, Republic Of', 'Korea (Republic of)', 'Korea', 'KR', 'KOR'
      currency 'KRW'

      level 10_000_000, '8%'
      level 40_000_000, '17%'
      level 80_000_000, '26%'
      remainder         '35%'
    end
  end
end
