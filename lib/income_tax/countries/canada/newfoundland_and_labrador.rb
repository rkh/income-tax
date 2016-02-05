module IncomeTax
  module Countries
    class Canada
      class NewfoundlandAndLabrador < Territory
        register "Newfoundland and Labrador", "Newfoundland", "Labrador", "NL"

        level offset(35148), "7.7%"
        level offset(35147), "12.5%"
        level offset(55205), "13.3%"
        level offset(50200), "14.3%"
        remainder            "15.3%"
      end
    end
  end
end
