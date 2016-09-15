module IncomeTax
  module Countries
    class Colombia < Models::Progressive
      register 'Colombia', 'CO', 'COL'
      currency 'COP'

      unit = 28_279
      level 1400 * unit, '0%'
      level 1700 * unit, '19%'
      level 4100 * unit, '28%'
      remainder '33%'
    end
  end
end
