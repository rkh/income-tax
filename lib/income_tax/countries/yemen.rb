module IncomeTax
  module Countries
    class Yemen < Models::Progressive
      register "Yemen", "YE", "YEM"
      currency "YER"

      level 20_000 * 12, "5%"
      remainder "15%"
    end
  end
end
