module IncomeTax
  module Countries
    class Israel < Models::Progressive
      register 'Israel', 'IL', 'ISR'
      currency 'ILS'

      level 63_360,  '10%'
      level 108_120, '14%'
      level 168_000, '21%'
      level 240_000, '31%'
      level 501_960, '34%'
      level 811_560, '48%'
      remainder '50%'
    end
  end
end
