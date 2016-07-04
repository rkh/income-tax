module IncomeTax
  module Countries
    class SouthSudan < Models::Progressive
      register 'South Sudan', 'SS', 'SSD'
      currency 'SSP'

      level 12 * 300,  '0%'
      level 12 * 5000, '10%'
      remainder        '15%'
    end
  end
end
