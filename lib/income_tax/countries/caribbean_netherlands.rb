module IncomeTax
  module Countries
    class CaribbeanNetherlands < Models::Progressive
      register 'Bonaire, Sint Eustatius and Saba', 'Caribbean Netherlands', 'Bonaire', 'Sint Eustatius', 'Saba', 'BQ', 'BES'
      currency 'USD'

      level 25_514,  '10%'
      level 38_271,  '16%'
      level 53_154,  '21%'
      level 79_730,  '27%'
      level 112_685, '32%'
      remainder '38%'
    end
  end
end
