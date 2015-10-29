module IncomeTax
  module Countries
    class Morocco < Models::Progressive
      register "Morocco", "MA", "MAR"
      currency "MAD"

      level 30000,  "0%"
      level 50000,  "10%"
      level 60000,  "20%"
      level 80000,  "30%"
      level 180000, "34%"
      remainder "38%"
    end
  end
end
