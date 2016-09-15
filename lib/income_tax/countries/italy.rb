module IncomeTax
  module Countries
    class Italy < Models::Progressive
      register 'Italy', 'IT', 'ITA'
      currency 'EUR'

      level 15_000, '23%'
      level 28_000, '27%'
      level 55_000, '38%'
      level 75_000, '41%'
      remainder '43%'
    end
  end
end
