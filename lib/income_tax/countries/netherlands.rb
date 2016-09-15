module IncomeTax
  module Countries
    class Netherlands < Models::Progressive
      register 'Netherlands', 'NL', 'NLD'
      currency 'EUR'

      level 19_645, '5.85%'
      level 33_363, '10.85%'
      level 55_991, '42%'
      remainder '52%'
    end
  end
end
