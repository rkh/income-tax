module IncomeTax
  module Countries
    class Israel < Models::Progressive
      register "Israel", "IL", "ISR"
      currency "ILS"

      level 63360,  "10%"
      level 108120, "14%"
      level 168000, "21%"
      level 240000, "31%"
      level 501960, "34%"
      level 811560, "48%"
      remainder     "50%"
    end
  end
end
