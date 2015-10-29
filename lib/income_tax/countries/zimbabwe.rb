module IncomeTax
  module Countries
    class Zimbabwe < Models::Progressive
      register "Zimbabwe", "ZW", "ZWE"
      currency "USD" # not ZWD!

      level 3_600,   "0%"
      level 18_000,  "20%"
      level 36_000,  "25%"
      level 60_000,  "30%"
      level 120_000, "35%"
      level 180_000, "40%"
      level 240_000, "45%"
      remainder      "50%"
    end
  end
end
