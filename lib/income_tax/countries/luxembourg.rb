module IncomeTax
  module Countries
    class Luxembourg < Models::Progressive
      register 'Luxembourg', 'LU', 'LUX'
      currency 'EUR'

      # TODO: Categories.
      # Category 1: calculate normal
      # Category 1a: if income below 45,060, subsctrace 50% of difference between income and 45,060
      # Category 2: use 50% of income as base for tax, multiply by two

      level 1126,   '0%'
      level 1317,   '8%'
      level 15_081,  '10%'
      level 16_989,  '12%'
      level 18_897,  '14%'
      level 20_805,  '16%'
      level 22_713,  '18%'
      level 24_621,  '20%'
      level 26_529,  '22%'
      level 28_437,  '24%'
      level 30_345,  '26%'
      level 32_253,  '28%'
      level 34_161,  '30%'
      level 36_069,  '32%'
      level 37_977,  '34%'
      level 39_885,  '36%'
      level 41_793,  '38%'
      level 100_000, '39%'
      remainder '40%'
    end
  end
end
