module IncomeTax
  module Countries
    class Namibia < Models::Progressive
      register 'Namibia', 'NA', 'NAM'
      currency 'NAD'

      level    50_000, '0%'
      level   100_000, '18%'
      level   300_000, '25%'
      level   500_000, '28%'
      level   800_000, '30%'
      level 1_500_000, '32%'
      remainder '37%'
    end
  end
end
