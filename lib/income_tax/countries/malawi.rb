module IncomeTax
  module Countries
    class Malawi < Models::Progressive
      register "Malawi", "MW", "MWI"
      currency "MWK"

      level 20000 * 12, "0%"
      level 25000 * 12, "15%"
      remainder         "30%"
    end
  end
end
