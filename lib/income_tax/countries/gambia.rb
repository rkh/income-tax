module IncomeTax
  module Countries
    class Gambia < Models::Progressive
      register "Gambia", "GM", "GMB"
      currency "GMD"

      level 18000, "0%"
      level 28000, "5%"
      level 38000, "10%"
      level 48000, "15%"
      level 58000, "20%"
      remainder "30%"
    end
  end
end
