module IncomeTax
  module Countries
    class Cyprus < Models::Progressive
      register "Cyprus", "CY", "CYP"
      currency "EUR"

      level 19500, "0%"
      level 28000, "20%"
      level 36300, "25%"
      level 60000, "30%"
      remainder "35%"
    end
  end
end
