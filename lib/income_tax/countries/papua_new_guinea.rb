module IncomeTax
  module Countries
    class PapuaNewGuinea < Models::Progressive
      register 'Papua New Guinea', 'PG', 'PNG'
      currency 'PGK'

      level 10_000,  '0%'
      level 18_000,  '22%'
      level 33_000,  '30%'
      level 70_000,  '35%'
      level 250_000, '40%'
      remainder '42%'
    end
  end
end
