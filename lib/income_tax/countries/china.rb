module IncomeTax
  module Countries
    class China < Models::Progressive
      register 'China', "China, People's Republic of", "China (People's Republic of)", 'CN', 'CHN'
      currency 'CNY'

      exemption = 3500
      level 1500  + exemption, '3%'
      level 4500  + exemption, '10%'
      level 9000  + exemption, '20%'
      level 35_000 + exemption, '25%'
      level 55_000 + exemption, '30%'
      level 80_000 + exemption, '35%'
      remainder '45%'
    end
  end
end
