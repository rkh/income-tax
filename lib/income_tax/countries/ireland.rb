module IncomeTax
  module Countries
    class Ireland < Models::Progressive
      register "Ireland", "Ireland, Republic Of", "IE", "IRL"
      currency "EUR"

      wants_options :married

      levels :married do
        level 42_800, "20%"
        remainder "40%"
      end

      levels :single do
        level 33_800, "20%"
        remainder "40%"
      end

      def level_category
        married? ? :married : :single
      end
    end
  end
end
