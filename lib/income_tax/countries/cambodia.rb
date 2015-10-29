module IncomeTax
  module Countries
    class Cambodia < Models::Progressive
      register "Cambodia", "KH", "KHM"
      currency "KHR"

      level 500000,   "0%"
      level 1250000,  "5%"
      level 8500000,  "10%"
      level 12500000, "15%"
      remainder       "20%"
    end
  end
end
