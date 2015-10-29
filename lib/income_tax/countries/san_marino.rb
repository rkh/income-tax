module IncomeTax
  module Countries
    class SanMarino < Models::Progressive
      register "San Marino", "SM", "SMR"
      currency "EUR"

      level   9_296.22, "12%"
      level  15_493.71, "17%"
      level  25_822.84, "23%"
      level  46_481.12, "29%"
      level  87_797.67, "35%"
      level 154_937.07, "40%"
      level 232_405.60, "45%"
      remainder         "50%"
    end
  end
end
