module IncomeTax
  module Countries
    class Chad < Models::Progressive
      register 'Chad', 'TD', 'TCD'
      currency 'XAF'

      level 300_000,  '20%'
      level 800_000,  '25%'
      level 1_000_000, '30%'
      level 1_500_000, '40%'
      level 2_000_000, '45%'
      level 3_000_000, '50%'
      level 6_000_000, '55%'
      remainder '60%'
    end
  end
end
