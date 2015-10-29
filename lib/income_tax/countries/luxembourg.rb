module IncomeTax
  module Countries
    class Luxembourg < Models::Progressive
      register "Luxembourg", "LU", "LUX"
      currency "EUR"

      # TODO: Categories.
      # Category 1: calculate normal
      # Category 1a: if income below 45,060, subsctrace 50% of difference between income and 45,060
      # Category 2: use 50% of income as base for tax, multiply by two

      level 1126,   "0%"
      level 1317,   "8%"
      level 15081,  "10%"
      level 16989,  "12%"
      level 18897,  "14%"
      level 20805,  "16%"
      level 22713,  "18%"
      level 24621,  "20%"
      level 26529,  "22%"
      level 28437,  "24%"
      level 30345,  "26%"
      level 32253,  "28%"
      level 34161,  "30%"
      level 36069,  "32%"
      level 37977,  "34%"
      level 39885,  "36%"
      level 41793,  "38%"
      level 100000, "39%"
      remainder     "40%"
    end
  end
end
