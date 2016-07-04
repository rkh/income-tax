module IncomeTax
  module Countries
    class Cyprus < Models::Progressive
      register 'Cyprus', 'CY', 'CYP'
      currency 'EUR'

      level 19_500, '0%'
      level 28_000, '20%'
      level 36_300, '25%'
      level 60_000, '30%'
      remainder '35%'
    end
  end
end
