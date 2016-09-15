module IncomeTax
  module Countries
    class SaintLucia < Models::Progressive
      register 'Saint Lucia', 'LC', 'LCA'
      currency 'XCD'

      level offset(18_000), '0%'
      level offset(10_000), '10%'
      level offset(10_000), '15%'
      level offset(10_000), '20%'
      remainder '30%'
    end
  end
end
