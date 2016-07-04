module IncomeTax
  module Countries
    class Belgium < Models::Progressive
      register 'Belgium', 'BE', 'BEL'
      currency 'EUR'

      level 8680,  '25%'
      level 12_360, '30%'
      level 20_600, '40%'
      level 37_750, '45%'
      remainder '50%'
    end
  end
end
