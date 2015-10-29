module IncomeTax
  module Countries
    class Gabon < Models::Progressive
      register "Gabon", "GA", "GAB"
      currency "XAF"

      level 1500000,  "0%"
      level 1920000,  "5%"
      level 2700000,  "10%"
      level 3600000,  "15%"
      level 5160000,  "20%"
      level 7500000,  "25%"
      level 11000000, "30%"
      remainder "35%"
    end
  end
end
