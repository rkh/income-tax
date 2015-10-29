module IncomeTax
  module Countries
    class Guyana < Models::Progressive
      register "Guyana", "GY", "GUY"
      currency "GYD"

      level 600000, "0%"
      remainder     "30%"
    end
  end
end
