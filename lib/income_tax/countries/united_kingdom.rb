module IncomeTax
  module Countries
    class UnitedKingdom < Models::Progressive
      register "United Kingdom", "UK", "United Kingdom of Great Britain and Northern Ireland", "Great Britain", "Britain", "GB", "GBR"
      currency "GBP"

      levels year: 2008 do
        level   5_000, "10%"
        level  32_000, "20%"
        level 150_000, "40%"
        remainder      "45%"
      end

      levels year: 2015 do
        level  31_785, "20%"
        level 150_000, "40%"
        remainder      "45%"
      end
    end
  end
end
