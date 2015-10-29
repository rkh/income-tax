module IncomeTax
  module Countries
    class Tokelau < Models::Progressive
      register "Tokelau", "TK", "TKL"
      currency "NZD"

      level 3000,  "5%"
      level 4000,  "7.5%"
      level 10000, "11%"
      level 17000, "15%"
      level 25000, "18.50%"
      remainder    "25%"
    end
  end
end
