module IncomeTax
  module Countries
    class CookIslands < Models::Progressive
      register 'Cook Islands', 'CK', 'COK'
      currency 'NZD'

      level 11_000, '0%'
      level 30_000, '18.5%'
      level 80_000, '27.5%'
      remainder '30%'
    end
  end
end
