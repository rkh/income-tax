module IncomeTax
  module Countries
    class Syria < Models::Progressive
      register "Syria", "Syrian Arab Republic", "SY", "SYR"
      currency "SYP"

      level 12 * 10_000, "0%"
      level 12 * 75_000, "5%"
      remainder "22%"
    end
  end
end
