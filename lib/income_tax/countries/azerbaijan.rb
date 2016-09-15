module IncomeTax
  module Countries
    class Azerbaijan < Models::Progressive
      register 'Azerbaijan', 'AZ', 'AZE'
      currency 'AZN'

      level 30_000, '14%'
      remainder '25%'
    end
  end
end
