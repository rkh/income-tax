module IncomeTax
  module Countries
    class Thailand < Models::Progressive
      register "Thailand", "TH", "THA"
      currency "THB"

      level   150_000, "0%"
      level   300_000, "5%"
      level   500_000, "10%"
      level   750_000, "15%"
      level 1_000_000, "20%"
      level 2_000_000, "25%"
      level 4_000_000, "30%"
      remainder        "35%"
    end
  end
end
