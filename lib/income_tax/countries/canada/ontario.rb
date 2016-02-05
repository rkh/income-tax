module IncomeTax
  module Countries
    class Canada
      class Ontario < Territory
        register "Ontario", "ON"

        level offset(41536),  "5.05%"
        level offset(41539),  "9.15%"
        level offset(66925),  "11.16%"
        level offset(70000),  "12.16%"
        remainder             "13.16%"
      end
    end
  end
end
