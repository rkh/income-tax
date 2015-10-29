module IncomeTax
  module Countries
    class Finland < Models::Progressive
      register "Finland", "FI", "FIN"
      currency "EUR"

      level 15600, "0%"
      level 23200, "6.5%"
      level 37800, "17.5%"
      level 68200, "21.5%"
      remainder "30%"
    end
  end
end
