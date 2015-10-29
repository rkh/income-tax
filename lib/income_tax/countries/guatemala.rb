module IncomeTax
  module Countries
    class Guatemala < Models::Progressive
      register "Guatemala", "GT", "GTM"
      currency "GTQ"

      level 65000,  "15%"
      level 180000, "20%"
      level 295000, "25%"
      remainder     "31%"
    end
  end
end
