module IncomeTax
  module Countries
    class Iran < Models::Progressive
      register "Iran", "Iran (Islamic Republic Of)", "IR", "IRN"
      currency "IRR"

      level    30_000_000, "15%"
      level   100_000_000, "20%"
      level   250_000_000, "25%"
      level 1_000_000_000, "30%"
      remainder "35%"
    end
  end
end
