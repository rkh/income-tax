module IncomeTax
  module Countries
    class Malta < Models::Progressive
      register 'Malta', 'MT', 'MLT'
      currency 'EUR'

      wants_options :married, :children

      levels :single do
        level 8_500, '0%'
        level 14_500, '15%'
        level 60_000, '25%'
        remainder     '35%'
      end

      levels :married do
        level 11_900, '0%'
        level 21_200, '15%'
        level 60_000, '25%'
        remainder     '35%'
      end

      levels :parent do
        level 9_800, '0%'
        level 15_800, '15%'
        level 60_000, '25%'
        remainder     '35%'
      end

      def level_category
        return :married if married?
        children > 0 ? :parent : :single
      end
    end
  end
end
