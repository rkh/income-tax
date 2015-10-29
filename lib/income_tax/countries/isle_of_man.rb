module IncomeTax
  module Countries
    class IsleOfMan < Models::Progressive
      register "Isle of Man", "IM", "IMN"
      currency "IMP"

      level 10500, "10%"
      remainder    "18%"
    end
  end
end
