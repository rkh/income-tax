module IncomeTax
  module Countries
    class Denmark < Models::Progressive
      register 'Denmark', 'DK', 'DNK'
      currency 'DKK'

      level 42_800,  '8%'
      level 421_000, '37%'
      remainder '44%'
    end
  end
end
