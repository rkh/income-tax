module IncomeTax
  module Countries
    class Austria < Models::Progressive
      register 'Austria', 'AT', 'AUT'
      currency 'EUR'

      levels year: 2005 do
        level 10_000, '0%'
        level 25_000, '38.333%'
        level 51_000, '43.596%'
        remainder '50%'
      end

      levels year: 2009 do
        level 11_000, '0%'
        level 25_000, '36.5%'
        level 60_000, '43.2143%'
        remainder '50%'
      end
    end
  end
end
