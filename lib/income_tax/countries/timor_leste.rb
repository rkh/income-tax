module IncomeTax
  module Countries
    class TimorLeste < Models::Progressive
      register "Timor-Leste", "East Timor", "TL", "TLS"
      currency "USD"

      level 6000, "0%"
      remainder   "10%"
    end
  end
end
