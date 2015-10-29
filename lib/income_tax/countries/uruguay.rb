module IncomeTax
  module Countries
    class Uruguay < Models::Progressive
      register "Uruguay", "UY", "URY"
      currency "UYU"

      level   256_368, "0%"
      level   366_240, "10%"
      level   549_360, "15%"
      level 1_831_200, "20%"
      level 2_746_800, "22%"
      level 4_211_760, "25%"
      remainder        "30%"
    end
  end
end
