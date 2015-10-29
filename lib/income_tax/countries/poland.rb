module IncomeTax
  module Countries
    class Poland < Models::Progressive
      register "Poland", "PL", "POL"
      currency "PLN"

      level  3_091, "0%"
      level 85_528, "18%"
      remainder     "32%"
    end
  end
end
