module IncomeTax
  module Countries
    class Nigeria < Models::Progressive
      register 'Nigeria', 'NG', 'NGA'
      currency 'NGN'

      level offset(300_000),  '7%'
      level offset(300_000),  '11%'
      level offset(500_000),  '15%'
      level offset(500_000),  '19%'
      level offset(1_600_000), '21%'
      remainder '24%'
    end
  end
end
