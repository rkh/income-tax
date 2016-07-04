module IncomeTax
  module Countries
    class Iceland < Models::Progressive
      register 'Iceland', 'IS', 'ISL'
      currency 'ISK'

      level 309_140, '37.3%'
      level 836_404, '39.74%'
      remainder '46.24%'
    end
  end
end
