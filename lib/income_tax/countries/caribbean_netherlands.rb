module IncomeTax
  module Countries
    class CaribbeanNetherlands < Models::Progressive
      register "Bonaire, Sint Eustatius and Saba", "Caribbean Netherlands", "Bonaire", "Sint Eustatius", "Saba", "BQ", "BES"
      currency "USD"

      level 25514,  "10%"
      level 38271,  "16%"
      level 53154,  "21%"
      level 79730,  "27%"
      level 112685, "32%"
      remainder     "38%"
    end
  end
end
