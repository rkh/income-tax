module IncomeTax
  module Countries
    class Mauritania < Models::Progressive
      register "Mauritania", "MR", "MRT"
      currency "MRO"

      level  90_000 * 12, "15%"
      level 210_000 * 12, "25%"
      remainder           "40%"
    end
  end
end
