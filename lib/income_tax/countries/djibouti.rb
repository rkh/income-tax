module IncomeTax
  module Countries
    class Djibouti < Models::Progressive
      register 'Djibouti', 'DJ', 'DJI'
      currency 'DJF'

      level 12 * 169,  '2%'
      level 12 * 282,  '15%'
      level 12 * 847,  '18%'
      level 12 * 2824, '20%'
      remainder        '30%'
    end
  end
end
