module IncomeTax
  module Countries
    class Senegal < Models::Progressive
      register 'Senegal', 'SN', 'SEN'
      currency 'XOF'

      level    600_000, '0%'
      level    890_000, '18%'
      level  1_010_000, '22%'
      level  1_410_000, '25%'
      level  2_475_000, '28%'
      level  3_540_000, '30%'
      level  7_650_000, '35%'
      level  9_650_000, '40%'
      level 12_650_000, '45%'
      remainder '50%'
    end
  end
end
