module IncomeTax
  module Countries
    class Turkey < Models::Progressive
      register "Turkey", "TR", "TUR"
      currency "TRY"

      level 10_000, "15%"
      level 25_000, "20%"
      level 88_000, "27%"
      remainder     "35%"
    end
  end
end
