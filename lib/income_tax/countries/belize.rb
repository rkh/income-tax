module IncomeTax
  module Countries
    class Belize < Models::Progressive
      register 'Belize', 'BZ', 'BLZ'
      currency 'BZD'

      level 10_000, '0%'
      remainder '25%'
    end
  end
end
