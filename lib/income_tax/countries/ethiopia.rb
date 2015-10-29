module IncomeTax
  module Countries
    class Ethiopia < Models::Progressive
      register "Ethiopia", "ET", "ETH"
      currency "ETB"

      level 12 * 150,  "0%"
      level 12 * 650,  "10%"
      level 12 * 1400, "15%"
      level 12 * 2350, "20%"
      level 12 * 3550, "25%"
      level 12 * 5000, "30%"
      remainder "35%"
    end
  end
end
