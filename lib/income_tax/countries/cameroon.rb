module IncomeTax
  module Countries
    class Cameroon < Models::Progressive
      register 'Cameroon', 'CM', 'CMR'
      currency 'XAF'

      level 2_000_000, '11%'
      level 3_000_000, '16.5%'
      level 5_000_000, '27.5%'
      remainder '38.5%'
    end
  end
end
