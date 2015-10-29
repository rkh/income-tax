module IncomeTax
  module Countries
    class Norway < Models::Progressive
      register "Norway", "NO", "NOR"
      currency "NOK"

      level 84420,  "0%"
      level 456400, "28%"
      level 741700, "37%"
      remainder "40%"
    end
  end
end
