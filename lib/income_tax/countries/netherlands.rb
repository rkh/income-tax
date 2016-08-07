module IncomeTax
  module Countries
    class Netherlands < Models::Progressive
      register "Netherlands", "NL", "NLD"
      currency "EUR"

      wants_options :birthday

      levels year: 2016 do
        level 19_922, "36.55%"
        level 33_715, "40.4%"
        level 66_421, "40.4%"
        remainder "52%"
      end

      levels :fixed_aow_age, year: 2016 do
        level 19_922, "18.65%"
        level 34_027, "22.5%"
        level 66_421, "40.4%"
        remainder "52%"
      end

      levels :progressive_aow_age, year: 2016 do
        level 19_922, "18.65%"
        level 33_715, "22.5%"
        level 66_421, "40.4%"
        remainder "52%"
      end

      def level_category
        if fixed_aow_age_reached?
          :fixed_aow_age
        elsif progressive_aow_age_reached?
          :progressive_aow_age
        else
          :default
        end
      end

      private

      def fixed_aow_age_reached?
        birthday < Date.new(1946, 1, 1) if birthday
      end

      def progressive_aow_age_reached?
        birthday < Date.new(1951, 6, 30) if birthday
      end
    end
  end
end
