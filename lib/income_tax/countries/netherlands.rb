module IncomeTax
  module Countries
    class Netherlands < Models::Progressive
      register "Netherlands", "NL", "NLD"
      currency "EUR"

      level 19645, "5.85%"
      level 33363, "10.85%"
      level 55991, "42%"
      remainder "52%"
    end
  end
end
