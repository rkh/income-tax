module IncomeTax
  module Countries
    class Liberia < Models::Progressive
      register "Liberia", "LR", "LBR"
      currency "LRD"

      level 70_000,  "0%"
      level 200_000, "5%"
      level 800_000, "15%"
      remainder      "25%"
    end
  end
end
