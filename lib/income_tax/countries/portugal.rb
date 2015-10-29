module IncomeTax
  module Countries
    class Portugal < Models::Progressive
      register "Portugal", "PT", "PRT"
      currency "EUR"

      level 7000,  "14.5%"
      level 20000, "28.5%"
      level 55000, "37%"
      level 80000, "45%"
      remainder    "48%"
    end
  end
end
