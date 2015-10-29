module IncomeTax
  module Countries
    class Canada < Models::Progressive
      register "Canada", "CA", "CAN"
      currency "CAD"

      level offset(44700), "15%"
      level offset(44700), "22%"
      level offset(49185), "26%"
      remainder            "29%"
    end
  end
end
