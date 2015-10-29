module IncomeTax
  module Countries
    class Angola < Models::Progressive
      register "Angola", "AO", "AGO"
      currency "AOA"

      level 12 * 25000,  "0%"
      level 12 * 30000,  "5%"
      level 12 * 35000,  "6%"
      level 12 * 40000,  "7%"
      level 12 * 45000,  "8%"
      level 12 * 50000,  "9%"
      level 12 * 70000,  "10%"
      level 12 * 90000,  "11%"
      level 12 * 110000, "12%"
      level 12 * 140000, "13%"
      level 12 * 170000, "14%"
      level 12 * 200000, "15%"
      level 12 * 230000, "16%"
      remainder          "17%"
    end
  end
end
