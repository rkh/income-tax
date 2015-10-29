module IncomeTax
  module Countries
    class Chad < Models::Progressive
      register "Chad", "TD", "TCD"
      currency "XAF"

      level 300000,  "20%"
      level 800000,  "25%"
      level 1000000, "30%"
      level 1500000, "40%"
      level 2000000, "45%"
      level 3000000, "50%"
      level 6000000, "55%"
      remainder      "60%"
    end
  end
end
