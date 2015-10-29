module IncomeTax
  module Countries
    class Greece < Models::Progressive
      register "Greece", "GR", "GRC"
      currency "EUR"

      level 50000, "26%"
      remainder "33%"
    end
  end
end
