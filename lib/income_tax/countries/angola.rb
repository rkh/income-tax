module IncomeTax
  module Countries
    class Angola < Models::Progressive
      register 'Angola', 'AO', 'AGO'
      currency 'AOA'

      level 12 * 25_000,  '0%'
      level 12 * 30_000,  '5%'
      level 12 * 35_000,  '6%'
      level 12 * 40_000,  '7%'
      level 12 * 45_000,  '8%'
      level 12 * 50_000,  '9%'
      level 12 * 70_000,  '10%'
      level 12 * 90_000,  '11%'
      level 12 * 110_000, '12%'
      level 12 * 140_000, '13%'
      level 12 * 170_000, '14%'
      level 12 * 200_000, '15%'
      level 12 * 230_000, '16%'
      remainder '17%'
    end
  end
end
