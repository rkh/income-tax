module IncomeTax
  module Countries
    class Tajikistan < Models::Progressive
      register "Tajikistan", "TJ", "TJK"
      currency "TJS"

      mmw = 20
      level mmw*12,     "0%"
      level mmw*12*100, "8%"
      remainder         "13%"
    end
  end
end
