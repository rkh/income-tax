module IncomeTax
  module Countries
    class Tunisia < Models::Progressive
      register "Tunisia", "TN", "TUN"
      currency "TND"

      level  1_500, "0%"
      level  5_000, "15%"
      level 10_000, "20%"
      level 20_000, "25%"
      level 50_000, "30%"
      remainder     "35%"
    end
  end
end
