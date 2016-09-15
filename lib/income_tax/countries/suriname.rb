module IncomeTax
  module Countries
    class Suriname < Models::Progressive
      register 'Suriname', 'SR', 'SUR'
      currency 'SRD'

      level 2_646.00, '0%'
      level 14_002.80, '8%'
      level 21_919.80, '18%'
      level 32_839.80, '28%'
      remainder        '38%'
    end
  end
end
