module IncomeTax
  module Countries
    class Aruba < Models::Progressive
      register "Aruba", "AW", "ABW"
      currency "AWG"

      level 7410,   "7.40%"
      level 17446,  "10.05%"
      level 28685,  "14.45%"
      level 41523,  "19.00%"
      level 55790,  "24.80%"
      level 71771,  "30.60%"
      level 86424,  "35.95%"
      level 102215, "40.10%"
      level 122347, "44.05%"
      level 151411, "45.60%"
      level 194337, "48.80%"
      level 260714, "54.85%"
      level 309131, "57.20%"
      remainder     "58.95%"
    end
  end
end
