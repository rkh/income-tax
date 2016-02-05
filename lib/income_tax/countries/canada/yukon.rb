module IncomeTax
  module Countries
    class Canada
      class Yukon < Territory
        register "Yukon", "YT"

        level offset(45282),  "6.4%"
        level offset(45281),  "9%"
        level offset(49825),  "10.9%"
        level offset(359612), "12.8%"
        remainder             "15%"
      end
    end
  end
end
