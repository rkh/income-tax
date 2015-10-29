module IncomeTax
  module Countries
    class Guinea < Models::Progressive
      register "Guinea", "GN", "GIN"
      currency "GNF"

      level  1_000_000, "0%"
      level  5_000_000, "5%"
      level 10_000_000, "10%"
      remainder         "15%"
    end
  end
end
