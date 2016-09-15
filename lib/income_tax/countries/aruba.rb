module IncomeTax
  module Countries
    class Aruba < Models::Progressive
      register 'Aruba', 'AW', 'ABW'
      currency 'AWG'

      level 7410, '7.40%'
      level 17_446,  '10.05%'
      level 28_685,  '14.45%'
      level 41_523,  '19.00%'
      level 55_790,  '24.80%'
      level 71_771,  '30.60%'
      level 86_424,  '35.95%'
      level 102_215, '40.10%'
      level 122_347, '44.05%'
      level 151_411, '45.60%'
      level 194_337, '48.80%'
      level 260_714, '54.85%'
      level 309_131, '57.20%'
      remainder '58.95%'
    end
  end
end
