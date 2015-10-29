module IncomeTax
  module Countries
    class Bhutan < Models::Progressive
      register "Bhutan", "BT", "BTN"
      currency "BTN"

      level 100000,  "0%"
      level 250000,  "10%"
      level 500000,  "15%"
      level 1000000, "20%"
      remainder "25%"
    end
  end
end
