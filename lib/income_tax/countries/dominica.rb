module IncomeTax
  module Countries
    class Dominica < Models::Progressive
      register "Dominica", "DM", "DMA"
      currency "XCD"

      level 25000, "0%"
      level 45000, "15%"
      level 75000, "25%"
      remainder    "35%"
    end
  end
end
