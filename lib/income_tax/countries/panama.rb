module IncomeTax
  module Countries
    class Panama < Models::Progressive
      register "Panama", "PA", "PAN"
      currency "USD"

      level 11_000, "0%"
      level 50_000, "15%"
      remainder     "25%"
    end
  end
end
