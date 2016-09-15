module IncomeTax
  module Countries
    class Australia < Models::Progressive
      register 'Australia', 'AU', 'AUS'
      currency 'AUD'

      wants_options :age

      levels :adult do
        level 18_200,  '0%'
        level 37_000,  '19%'
        level 80_000,  '32.5%'
        level 180_000, '37%'
        remainder '45%'
      end

      levels :minor do
        level 417,  '0%'
        level 1307, '65%'
        remainder '45%'
      end

      def level_category
        adult? ? :adult : :minor
      end

      def adult?
        age >= 18
      end
    end
  end
end
