module IncomeTax
  module Countries
    class Egypt < Models::Progressive
      register 'Egypt', 'EG', 'EGY'
      currency 'EGP'

      level 5000, '0%'
      level 20_000,  '10%'
      level 40_000,  '15%'
      level 100_000, '20%'
      remainder '25%'
    end
  end
end
