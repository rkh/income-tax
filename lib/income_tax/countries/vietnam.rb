module IncomeTax
  module Countries
    class Vietnam < Models::Progressive
      register "Vietnam", "Viet Nam", "VN", "VNM"
      currency "VND"

      factor = 12 * 1_000_000
      level factor * 5,  "5%"
      level factor * 10, "10%"
      level factor * 18, "15%"
      level factor * 32, "20%"
      level factor * 52, "25%"
      level factor * 80, "30%"
      remainder "35%"
    end
  end
end
