module IncomeTax
  module Countries
    class Niue < Models::Progressive
      register "Niue", "NU", "NIU"
      currency "NZD"

      level 2850,  "10%"
      level 8550,  "15%"
      level 19950, "40%"
      remainder    "50%"
    end
  end
end
