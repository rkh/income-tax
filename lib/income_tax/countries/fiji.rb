module IncomeTax
  module Countries
    class Fiji < Models::Progressive
      register 'Fiji', 'FJ', 'FJI'
      currency 'FJD'

      level 16_000,   '0%'
      level 22_000,   '7%'
      level 50_000,   '18%'
      level 270_000,  '20%'
      level 300_000,  '43%'
      level 350_000,  '44%'
      level 400_000,  '45%'
      level 450_000,  '46%'
      level 500_000,  '47%'
      level 1_000_000, '48%'
      remainder '49%'
    end
  end
end
