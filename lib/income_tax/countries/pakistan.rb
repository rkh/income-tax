module IncomeTax
  module Countries
    class Pakistan < Models::Progressive
      register "Pakistan", "PK", "PAK"
      currency "PKR"

      level   400_000, "0%"
      level   500_000, "2%"
      level   750_000, "5%"
      level 1_400_000, "10%"
      level 1_500_000, "12.5%"
      level 1_800_000, "15%"
      level 2_500_000, "17.5%"
      level 3_000_000, "20%"
      level 3_500_000, "22.5%"
      level 4_000_000, "25%"
      level 7_000_000, "27.5%"
      remainder "30%"
    end
  end
end
