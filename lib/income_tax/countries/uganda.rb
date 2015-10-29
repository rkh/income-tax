module IncomeTax
  module Countries
    class Uganda < Models::Progressive
      register "Uganda", "UG", "UGA"
      currency "UGX"

      level 235_000, "0%"
      level 335_000, "10%"
      level 410_000, "20%"
      remainder      "30%"
    end
  end
end
