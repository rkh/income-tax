module IncomeTax
  module Countries
    class Japan < Models::Progressive
      register "Japan", "JP", "JPN"
      currency "JPY"

      level 1950000, "15%"
      level 1350000, "20%"
      level 3650000, "30%"
      level 2050000, "33%"
      level 9000000, "43%"
      remainder      "50%"
    end
  end
end
