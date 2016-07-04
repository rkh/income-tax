module IncomeTax
  module Countries
    class SouthAfrica < Models::Progressive
      register 'South Africa', 'ZA', 'ZAF'
      currency 'ZAR'

      level 181_900, '18%'
      level 284_100, '26%'
      level 393_200, '31%'
      level 550_100, '36%'
      level 701_300, '39%'
      remainder      '41%'
    end
  end
end
