module IncomeTax
  module Countries
    class Dominica < Models::Progressive
      register 'Dominica', 'DM', 'DMA'
      currency 'XCD'

      level 25_000, '0%'
      level 45_000, '15%'
      level 75_000, '25%'
      remainder '35%'
    end
  end
end
