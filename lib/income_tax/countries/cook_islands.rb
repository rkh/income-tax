module IncomeTax
  module Countries
    class CookIslands < Models::Progressive
      register "Cook Islands", "CK", "COK"
      currency "NZD"

      level 11000, "0%"
      level 30000, "18.5%"
      level 80000, "27.5%"
      remainder "30%"
    end
  end
end
