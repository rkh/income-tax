module IncomeTax
  module Countries
    class Japan < Models::Progressive
      register 'Japan', 'JP', 'JPN'
      currency 'JPY'

      level 1_950_000, '15%'
      level 1_350_000, '20%'
      level 3_650_000, '30%'
      level 2_050_000, '33%'
      level 9_000_000, '43%'
      remainder '50%'
    end
  end
end
