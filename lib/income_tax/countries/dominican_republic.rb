module IncomeTax
  module Countries
    class DominicanRepublic < Models::Progressive
      register 'Dominican Republic', 'DO', 'DOM'
      currency 'DOP'

      level 399_923, '0%'
      level 599_884, '15%'
      level 833_171, '20%'
      remainder '25%'
    end
  end
end
