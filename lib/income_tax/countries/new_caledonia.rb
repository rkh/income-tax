module IncomeTax
  module Countries
    class NewCaledonia < Models::Progressive
      register "New Caledonia", "NC", "NCL"
      currency "XPF"

      level 1_000_000, "0%"
      level 1_800_000, "4%"
      level 3_000_000, "12%"
      level 4_500_000, "25%"
      remainder "40%"
    end
  end
end
