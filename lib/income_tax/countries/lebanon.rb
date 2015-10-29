module IncomeTax
  module Countries
    class Lebanon < Models::Progressive
      register "Lebanon", "LB", "LBN"
      currency "LBP"

      level 6_000_000,   "2%"
      level 15_000_000,  "4%"
      level 30_000_000,  "7%"
      level 60_000_000,  "11%"
      level 120_000_000, "15%"
      remainder          "20%"
    end
  end
end
