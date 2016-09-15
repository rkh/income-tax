module IncomeTax
  module Countries
    class Morocco < Models::Progressive
      register 'Morocco', 'MA', 'MAR'
      currency 'MAD'

      level 30_000,  '0%'
      level 50_000,  '10%'
      level 60_000,  '20%'
      level 80_000,  '30%'
      level 180_000, '34%'
      remainder '38%'
    end
  end
end
