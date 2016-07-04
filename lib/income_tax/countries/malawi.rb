module IncomeTax
  module Countries
    class Malawi < Models::Progressive
      register 'Malawi', 'MW', 'MWI'
      currency 'MWK'

      level 20_000 * 12, '0%'
      level 25_000 * 12, '15%'
      remainder '30%'
    end
  end
end
