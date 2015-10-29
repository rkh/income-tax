module IncomeTax
  module Countries
    class Curacao < Models::Progressive
      register "Curaçao", "Curacao", "CW", "CUW"
      currency "ANG"

      level 25514,  "10%"
      level 38271,  "16%"
      level 53154,  "21%"
      level 79730,  "27%"
      level 112685, "32%"
      remainder     "38%"
    end
  end
end
