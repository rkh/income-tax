module IncomeTax
  module Countries
    class Canada
      class Nunavut < Territory
        register "Nunavut", "NU"

        level offset(43176), "4%"
        level offset(43175), "7%"
        level offset(54037), "9%"
        remainder            "11.5%"
      end
    end
  end
end
