module IncomeTax
  module Countries
    class Comoros < Models::Progressive
      register "Comoros", "KM", "COM"
      currency "KMF"

      level 150000,  "0%"
      level 500000,  "5%"
      level 1000000, "10%"
      level 1500000, "15%"
      level 2500000, "20%"
      level 3500000, "25%"
      remainder      "30%"
    end
  end
end
