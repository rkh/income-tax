module IncomeTax
  module Countries
    class SaintPierreAndMiquelon < Models::Progressive
      register "Saint Pierre And Miquelon", "Saint Pierre", "Miquelon", "PM", "SPM"
      currency "EUR"

      level 7870,  "0%"
      level 8180,  "5%"
      level 9980,  "10%"
      level 11470, "15%"
      level 14690, "20%"
      level 18360, "25%"
      level 21840, "30%"
      level 25330, "35%"
      level 39260, "40%"
      level 53000, "45%"
      level 66250, "50%"
      remainder    "55%"
    end
  end
end
