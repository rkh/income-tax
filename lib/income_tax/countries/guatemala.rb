module IncomeTax
  module Countries
    class Guatemala < Models::Progressive
      register 'Guatemala', 'GT', 'GTM'
      currency 'GTQ'

      level 65_000,  '15%'
      level 180_000, '20%'
      level 295_000, '25%'
      remainder '31%'
    end
  end
end
