module IncomeTax
  module Countries
    class SaintMartin < Models::Progressive
      register 'Saint Martin', 'MF', 'MAF'
      currency 'EUR'

      level 6011,  '0%'
      level 11_991, '5.5%'
      level 26_631, '14%'
      level 71_397, '30%'
      remainder '41%'
    end
  end
end
