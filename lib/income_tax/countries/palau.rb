module IncomeTax
  module Countries
    class Palau < Models::Progressive
      register "Palau", "PW", "PLW"
      currency "USD"

      level 5000,  "9.3%"
      level 25000, "15%"
      remainder    "19.6%"
    end
  end
end
