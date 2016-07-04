module IncomeTax
  module Countries
    class Benin < Models::Progressive
      register 'Benin', 'BJ', 'BEN'
      currency 'XOF'

      level 300_000, '0%'
      level 2_000_000, '20%'
      level 5_500_000, '30%'
      remainder        '45%'
    end
  end
end
