module IncomeTax
  module Countries
    class Nepal < Models::Progressive
      register 'Nepal', 'NP', 'NPL'
      currency 'NPR'

      wants_options :married

      levels :single do
        level   250_000, '1%'
        level   350_000, '15%'
        level 2_500_000, '25%'
        remainder '25%' # TODO: + 40% of all tax
      end

      levels :married do
        level   300_000, '1%'
        level   400_000, '15%'
        level 2_500_000, '25%'
        remainder '25%' # TODO: + 40% of all tax
      end

      def level_category
        married? ? :married : :single
      end
    end
  end
end
