module IncomeTax
  module Countries
    class Austria < Models::Progressive
      register "Austria", "AT", "AUT"
      currency "EUR"

      level 3640,  "0%"
      level 7270,  "21%"
      level 21800, "31%"
      level 50870, "41%"
      remainder "50%"
    end
  end
end
