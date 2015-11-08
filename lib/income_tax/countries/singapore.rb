module IncomeTax
  module Countries
    class Singapore < Models::Progressive
      register "Singapore", "SG", "SGP"
      currency "SGD"

      levels year: 2015 do
        level offset(20_000),  "0%"
        level offset(10_000),  "2%"
        level offset(10_000),  "3.5%"
        level offset(40_000),  "7%"
        level offset(40_000),  "11.5%"
        level offset(40_000),  "15%"
        level offset(40_000),  "17%"
        level offset(120_000), "18%"
        remainder "20%"
      end

      levels year: 2017 do
        level offset(20_000), "0%"
        level offset(10_000), "2%"
        level offset(10_000), "3.5%"
        level offset(40_000), "7%"
        level offset(40_000), "11.5%"
        level offset(40_000), "15%"
        level offset(40_000), "18%"
        level offset(40_000), "19%"
        level offset(40_000), "19.5%"
        level offset(40_000), "20%"
        remainder "22%"
      end
    end
  end
end
