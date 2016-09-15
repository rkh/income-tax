module IncomeTax
  module Countries
    class Madagascar < Models::Progressive
      register 'Madagascar', 'MG', 'MDG'
      currency 'MGA'

      level 250_000, '0%'
      remainder '21%'
    end
  end
end
