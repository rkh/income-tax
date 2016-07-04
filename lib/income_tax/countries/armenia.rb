module IncomeTax
  module Countries
    class Armenia < Models::Progressive
      register 'Armenia', 'AM', 'ARM'
      currency 'AMD'

      level 12 * 80_000, '10%'
      remainder '20%'
    end
  end
end
