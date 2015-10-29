module IncomeTax
  module Countries
    class CapeVerde < Models::Progressive
      register "Cape Verde", "Cabo Verde", "CV", "CPV"
      currency "CVE"

      level 385000,  "15%"
      level 810000,  "20%"
      level 1620000, "27.5%"
      level 2430000, "35%"
      remainder      "45%"
    end
  end
end
