module IncomeTax
  module Countries
    class Somalia < Models::Progressive
      register "Somalia", "SO", "SOM"
      currency "SOS"

      levels  4_812_000, "0%"
      levels  9_600_000, "2%"
      levels 19_200_000, "4%"
      levels 33_600_000, "6%"
      levels 48_000_000, "8%"
      remainder          "10%"
    end
  end
end
