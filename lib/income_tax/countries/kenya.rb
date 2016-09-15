module IncomeTax
  module Countries
    class Kenya < Models::Progressive
      register 'Kenya', 'KE', 'KEN'
      currency 'KES'

      level 10_164, '10%'
      level 19_740, '15%'
      level 29_316, '20%'
      level 38_892, '25%'
      remainder '30%'
    end
  end
end
