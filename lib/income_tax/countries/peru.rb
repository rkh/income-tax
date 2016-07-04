module IncomeTax
  module Countries
    class Peru < Models::Progressive
      register 'Peru', 'PE', 'PER'
      currency 'PEN'

      level 50_000, '15%'
      remainder '30%'
    end
  end
end
