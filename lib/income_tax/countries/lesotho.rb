module IncomeTax
  module Countries
    class Lesotho < Models::Progressive
      register 'Lesotho', 'LS', 'LSO'
      currency 'LSL'

      credit = 538.83 * 12
      level 2694.17 * 12 + credit, '0%'
      level 4564.18 * 12 + credit, '20%'
      remainder '30%'
    end
  end
end
