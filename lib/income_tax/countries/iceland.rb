module IncomeTax
  module Countries
    class Iceland < Models::Progressive
      register "Iceland", "IS", "ISL"
      currency "ISK"

      level 309140, "37.3%"
      level 836404, "39.74%"
      remainder     "46.24%"
    end
  end
end
