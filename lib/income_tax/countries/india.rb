module IncomeTax
  module Countries
    class India < Models::Progressive
      register "India", "IN", "IND"
      currency "INR"

      base = 250000
      level 1 * base,  "0%"
      level 2 * base, "10%"
      level 4 * base, "20%"
      remainder       "30%"
    end
  end
end
