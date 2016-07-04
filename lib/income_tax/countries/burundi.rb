module IncomeTax
  module Countries
    class Burundi < Models::Progressive
      register 'Burundi', 'BI', 'BDI'
      currency 'BIF'

      level 1_800_000, '0%'
      level 3_600_000, '20%'
      remainder '30%'
    end
  end
end
