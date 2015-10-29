module IncomeTax
  module Countries
    class Kenya < Models::Progressive
      register "Kenya", "KE", "KEN"
      currency "KES"

      level 10164, "10%"
      level 19740, "15%"
      level 29316, "20%"
      level 38892, "25%"
      remainder    "30%"
    end
  end
end
