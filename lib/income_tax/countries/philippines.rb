module IncomeTax
  module Countries
    class Philippines < Models::Progressive
      register "Philippines", "PH", "PHL"
      currency "PHP"

      level  10_000, "5%"
      level  30_000, "10%"
      level  70_000, "15%"
      level 140_000, "20%"
      level 250_000, "25%"
      level 500_000, "30%"
      remainder      "32%"
    end
  end
end
