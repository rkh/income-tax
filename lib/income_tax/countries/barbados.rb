module IncomeTax
  module Countries
    class Barbados < Models::Progressive
      register "Barbados", "BB", "BRB"
      currency "BBD"

      wants_options :age

      level 25000, "0%"
      level 35000, "17.5%"
      remainder "35%"

      levels :senior do
        level 40000, "0%"
        level 35000, "17.5%"
        remainder "35%"
      end

      def level_category
        senior? ? :senior : super
      end

      def senior?
        age >= 60
      end
    end
  end
end
