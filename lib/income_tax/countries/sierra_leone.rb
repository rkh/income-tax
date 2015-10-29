module IncomeTax
  module Countries
    class SierraLeone < Models::Progressive
      register "Sierra Leone", "SL", "SLE"
      currency "SLL"

      level 1800000,         "0%"
      level offset(3600000), "15%"
      level offset(3600000), "20%"
      remainder              "30%"
    end
  end
end
