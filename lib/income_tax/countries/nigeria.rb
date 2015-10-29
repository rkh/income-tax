module IncomeTax
  module Countries
    class Nigeria < Models::Progressive
      register "Nigeria", "NG", "NGA"
      currency "NGN"

      level offset(300000),  "7%"
      level offset(300000),  "11%"
      level offset(500000),  "15%"
      level offset(500000),  "19%"
      level offset(1600000), "21%"
      remainder "24%"
    end
  end
end
