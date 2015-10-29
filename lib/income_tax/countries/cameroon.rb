module IncomeTax
  module Countries
    class Cameroon < Models::Progressive
      register "Cameroon", "CM", "CMR"
      currency "XAF"

      level 2000000, "11%"
      level 3000000, "16.5%"
      level 5000000, "27.5%"
      remainder "38.5%"
    end
  end
end
