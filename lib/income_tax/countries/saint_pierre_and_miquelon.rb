module IncomeTax
  module Countries
    class SaintPierreAndMiquelon < Models::Progressive
      register 'Saint Pierre And Miquelon', 'Saint Pierre', 'Miquelon', 'PM', 'SPM'
      currency 'EUR'

      level 7870,  '0%'
      level 8180,  '5%'
      level 9980,  '10%'
      level 11_470, '15%'
      level 14_690, '20%'
      level 18_360, '25%'
      level 21_840, '30%'
      level 25_330, '35%'
      level 39_260, '40%'
      level 53_000, '45%'
      level 66_250, '50%'
      remainder '55%'
    end
  end
end
