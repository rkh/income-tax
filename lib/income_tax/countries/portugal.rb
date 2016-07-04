module IncomeTax
  module Countries
    class Portugal < Models::Progressive
      register 'Portugal', 'PT', 'PRT'
      currency 'EUR'

      level 7000,  '14.5%'
      level 20_000, '28.5%'
      level 55_000, '37%'
      level 80_000, '45%'
      remainder '48%'
    end
  end
end
