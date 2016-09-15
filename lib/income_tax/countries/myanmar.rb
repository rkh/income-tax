module IncomeTax
  module Countries
    class Myanmar < Models::Progressive
      register 'Myanmar', 'Burma', 'MM', 'MMR'
      currency 'MMK'

      level  2_000_000, '0%'
      level  5_000_000, '5%'
      level 10_000_000, '10%'
      level 20_000_000, '15%'
      level 30_000_000, '20%'
      remainder '25%'
    end
  end
end
