module IncomeTax
  module Countries
    class Canada
      class BritishColumbia < Territory
        register "British Columbia", "BC"

        level offset(38210), "5.06%"
        level offset(38211), "7.7%"
        level offset(11320), "10.5%"
        level offset(18802), "12.29%"
        remainder            "14.7%"
      end
    end
  end
end
