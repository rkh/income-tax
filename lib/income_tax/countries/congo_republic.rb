module IncomeTax
  module Countries
    class CongoRepublic < Models::Progressive
      register "Congo (Republic of the)", "Congo, Republic of the", "CG", "COG"
      currency "XAF"

      level 464000,  "1%"
      level 1000000, "10%"
      level 3000000, "25%"
      level 8000000, "40%"
      remainder      "45%"
    end
  end
end
