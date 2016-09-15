module IncomeTax
  module Countries
    class Cuba < Models::Progressive
      register 'Cuba', 'CU', 'CUB'
      currency 'CUP'

      level 10_000, '0%'
      level 50_000, '15%'
      remainder '50%'
    end
  end
end
