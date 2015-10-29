module IncomeTax
  module Countries
    class Mexico < Models::Progressive
      register "Mexico", "MX", "MEX"
      currency "MXN"

      level 5953,    "1.92%"
      level 50525,   "6.4%"
      level 88794,   "10.88%"
      level 103218,  "16%"
      level 123581,  "17.2%"
      level 249244,  "21.36%"
      level 392842,  "23.52%"
      level 750000,  "30%"
      level 1000000, "32%"
      level 3000000, "34%"
      remainder "35%"
    end
  end
end
