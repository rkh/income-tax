module IncomeTax
  module Countries
    class SaintVincentAndTheGrenedines < Models::Progressive
      register "Saint Vincent And The Grenedines", "Saint Vincent", "The Grenedines", "VC", "VCT"
      currency "XCD"

      level 5000,  "12%"
      level 10000, "20%"
      level 30000, "30%"
      remainder    "40%"
    end
  end
end
