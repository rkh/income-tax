module IncomeTax
  module Countries
    class France < Models::Progressive
      register "France", "FR", "FRA"
      currency "EUR"

      wants_options :married, :children

      levels :per_unit do
        level 9690,   "0%"
        level 26764,  "14%"
        level 71754,  "30%"
        level 151956, "41%"
        remainder     "45%"
      end

      def levels
        super(:per_unit).multiply_brackets(units)
      end

      def units
        units = married? ? 2 : 1

        if children and children > 0
          units += 0.5
          units += children * 0.5
        end

        units
      end
    end
  end
end
