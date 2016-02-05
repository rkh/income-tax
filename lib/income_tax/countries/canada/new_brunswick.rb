module IncomeTax
  module Countries
    class Canada
      class NewBrunswick < Territory
        register "New Brunswick", "NB"

        level offset(40492),  "9.68%"
        level offset(40493),  "14.82%"
        level offset(50679),  "16.52%"
        level offset(18336),  "17.84%"
        level offset(100000), "21%"
        remainder             "25.75%"
      end
    end
  end
end
