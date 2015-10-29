module IncomeTax
  module Countries
    class Italy < Models::Progressive
      register "Italy", "IT", "ITA"
      currency "EUR"

      level 15000, "23%"
      level 28000, "27%"
      level 55000, "38%"
      level 75000, "41%"
      remainder    "43%"
    end
  end
end
