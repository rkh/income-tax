module IncomeTax
  module Countries
    class Botswana < Models::Progressive
      register 'Botswana', 'BW', 'BWA'
      currency 'BWP'

      level 30_000, '0%'
      remainder '25%'
    end
  end
end
