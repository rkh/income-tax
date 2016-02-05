module IncomeTax
  module Countries
    class Canada
      class Alberta < Territory
        register "Alberta", "AB"

        level offset(125000), "10%"
        level offset(25000),  "12%"
        level offset(50000),  "13%"
        level offset(100000), "14%"
        remainder             "15%"
      end
    end
  end
end
