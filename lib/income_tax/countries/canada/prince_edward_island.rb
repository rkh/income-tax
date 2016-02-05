module IncomeTax
  module Countries
    class Canada
      class PrinceEdwardIsland < Territory
        register "Prince Edward Island", "PE"

        level offset(31984), "9.8%"
        level offset(31985), "13.8%"
        remainder            "16.7%"
      end
    end
  end
end
