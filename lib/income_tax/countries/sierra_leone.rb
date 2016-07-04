module IncomeTax
  module Countries
    class SierraLeone < Models::Progressive
      register 'Sierra Leone', 'SL', 'SLE'
      currency 'SLL'

      level 1_800_000,         '0%'
      level offset(3_600_000), '15%'
      level offset(3_600_000), '20%'
      remainder '30%'
    end
  end
end
