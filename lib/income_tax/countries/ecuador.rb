module IncomeTax
  module Countries
    class Ecuador < Models::Progressive
      register "Ecuador", "EC", "ECU"
      currency "USD"

      level 10180,  "0%"
      level 12970,  "5%"
      level 16220,  "10%"
      level 19470,  "12%"
      level 38930,  "15%"
      level 58390,  "20%"
      level 77870,  "25%"
      level 103810, "30%"
      remainder     "35%"
    end
  end
end
