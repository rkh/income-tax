module IncomeTax
  module Countries
    class Uzbekistan < Models::Progressive
      register "Uzbekistan", "UZ", "UZB"
      currency "UZS"

      mmw = 28_040
      ymw = 12 * mmw

      level ymw * 6,  "12%"
      level ymw * 10, "17%"
      remainder       "23%"
    end
  end
end
