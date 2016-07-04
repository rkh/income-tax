module IncomeTax
  module Countries
    class Ghana < Models::Progressive
      register 'Ghana', 'GH', 'GHA'
      currency 'GHS'

      level 1584,          '0%'
      level offset(792),   '5%'
      level offset(1104),  '10%'
      level offset(28_200), '17.5%'
      remainder '25%'
    end
  end
end
