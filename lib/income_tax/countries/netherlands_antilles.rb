module IncomeTax
  module Countries
    class NetherlandsAntilles < Models::Progressive
      register 'Netherlands Antilles', 'AN', 'ANT'
      currency 'ANG'

      level 25_514,  '10%'
      level 38_271,  '16%'
      level 53_154,  '21%'
      level 79_730,  '27%'
      level 112_685, '32%'
      remainder '38%'
    end
  end
end
