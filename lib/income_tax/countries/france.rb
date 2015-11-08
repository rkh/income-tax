module IncomeTax
  module Countries
    class France < Models::Progressive
      register "France", "FR", "FRA"
      currency "EUR"

      wants_options :married, :children

      levels :per_unit, year: 2015 do
        level 6011,   "0%"
        level 11991,  "5.5%"
        level 26631,  "14%"
        level 71397,  "30%"
        level 151200, "41%"
        remainder     "45%"
      end

      levels :per_unit, year: 2016 do
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
