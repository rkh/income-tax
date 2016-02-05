module IncomeTax
  module Countries
    class Canada
      class Saskatchewan < Territory
        register "Saskatchewan", "SK"

        level offset(44601), "11%"
        level offset(82829), "13%"
        remainder            "15%"
      end
    end
  end
end
