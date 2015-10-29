module IncomeTax
  module Countries
    class Argentina < Models::Progressive
      register "Argentina", "AR", "ARG"
      currency "ARS"

      level 10000,  "9%"
      level 20000,  "14%"
      level 30000,  "19%"
      level 60000,  "23%"
      level 90000,  "27%"
      level 120000, "31%"
      remainder     "35%"
    end
  end
end
