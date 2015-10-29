module IncomeTax
  module Countries
    class Mozambique < Models::Progressive
      register "Mozambique", "MZ", "MOZ"
      currency "MZN"

      level 42000,   "10%"
      level 168000,  "15%"
      level 504000,  "20%"
      level 1512000, "25%"
      remainder      "32%"
    end
  end
end
