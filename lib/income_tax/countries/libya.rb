module IncomeTax
  module Countries
    class Libya < Models::Progressive
      register 'Libya', 'LY', 'LBY'
      currency 'LYD'

      # TODO: Allowances: 1800 Single person, 2400 Married couples, 300 per child
      level 12_000, '5%'
      remainder '10%'
    end
  end
end
