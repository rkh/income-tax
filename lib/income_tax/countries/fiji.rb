module IncomeTax
  module Countries
    class Fiji < Models::Progressive
      register "Fiji", "FJ", "FJI"
      currency "FJD"

      level 16000,   "0%"
      level 22000,   "7%"
      level 50000,   "18%"
      level 270000,  "20%"
      level 300000,  "43%"
      level 350000,  "44%"
      level 400000,  "45%"
      level 450000,  "46%"
      level 500000,  "47%"
      level 1000000, "48%"
      remainder "49%"
    end
  end
end
