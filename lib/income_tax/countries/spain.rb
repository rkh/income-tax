module IncomeTax
  module Countries
    class Spain < Models::Progressive
      register "Spain", "ES", "ESP"
      currency "EUR"

      level 12_450, "19%"
      level 20_200, "24%"
      level 35_200, "30%"
      level 60_000, "37%"
      remainder     "45%"
    end
  end
end
