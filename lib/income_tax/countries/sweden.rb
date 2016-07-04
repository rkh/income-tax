module IncomeTax
  module Countries
    class Sweden < Models::Progressive
      register 'Sweden', 'SE', 'SWE'
      currency 'SEK'
      level 18_800,  '0%'
      level 43_390,  '21%'
      level 615_700, '51%'
      remainder '56%'
    end
  end
end
