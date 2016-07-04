module IncomeTax
  module Countries
    class Mozambique < Models::Progressive
      register 'Mozambique', 'MZ', 'MOZ'
      currency 'MZN'

      level 42_000,   '10%'
      level 168_000,  '15%'
      level 504_000,  '20%'
      level 1_512_000, '25%'
      remainder '32%'
    end
  end
end
