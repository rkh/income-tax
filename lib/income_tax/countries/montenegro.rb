module IncomeTax
  module Countries
    class Montenegro < Models::Progressive
      register 'Montenegro', 'ME', 'MNE'
      currency 'EUR'

      level 720 * 12, '9%'
      remainder '15%'
    end
  end
end
