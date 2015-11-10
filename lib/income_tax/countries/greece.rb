module IncomeTax
  module Countries
    class Greece < Models::Progressive
      register "Greece", "GR", "GRC"
      currency "EUR"

      level 25_000, "22%"
      level 42_000, "32%"
      remainder     "42%"
    end
  end
end
