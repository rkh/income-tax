module IncomeTax
  module Countries
    class Sweden < Models::Progressive
      register "Sweden", "SE", "SWE"
      currency "SEK"
      level 18800,  "0%"
      level 43390,  "21%"
      level 615700, "51%"
      remainder     "56%"
    end
  end
end
