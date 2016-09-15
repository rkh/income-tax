module IncomeTax
  module Countries
    class Ecuador < Models::Progressive
      register 'Ecuador', 'EC', 'ECU'
      currency 'USD'

      level 10_180,  '0%'
      level 12_970,  '5%'
      level 16_220,  '10%'
      level 19_470,  '12%'
      level 38_930,  '15%'
      level 58_390,  '20%'
      level 77_870,  '25%'
      level 103_810, '30%'
      remainder '35%'
    end
  end
end
