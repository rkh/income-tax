module IncomeTax
  module Countries
    class Slovenia < Models::Progressive
      register 'Slovenia', 'SI', 'SVN'
      currency 'EUR'

      level 7841,  '16%'
      level 18_534, '27%'
      level 69_314, '41%'
      remainder '50%'
    end
  end
end
