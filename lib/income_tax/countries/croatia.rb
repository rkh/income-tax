module IncomeTax
  module Countries
    class Croatia < Models::Progressive
      register 'Croatia', 'HR', 'HRV'
      currency 'HRK'

      level 26_400,  '12%'
      level 105_600, '25%'
      remainder '40%'
    end
  end
end
