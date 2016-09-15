module IncomeTax
  module Countries
    class Gabon < Models::Progressive
      register 'Gabon', 'GA', 'GAB'
      currency 'XAF'

      level 1_500_000,  '0%'
      level 1_920_000,  '5%'
      level 2_700_000,  '10%'
      level 3_600_000,  '15%'
      level 5_160_000,  '20%'
      level 7_500_000,  '25%'
      level 11_000_000, '30%'
      remainder '35%'
    end
  end
end
