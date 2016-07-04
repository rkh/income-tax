module IncomeTax
  module Countries
    class Nicaragua < Models::Progressive
      register 'Nicaragua', 'NI', 'NIC'
      currency 'NIO'

      wants_options :self_employed

      levels :employee do
        level 75_000, '0%'
        level 100_000, '10%'
        level 200_000, '15%'
        level 300_000, '20%'
        level 500_000, '25%'
        remainder '30%'
      end

      levels :self_employed do
        level 50_000, '0%'
        level 100_000, '10%'
        level 200_000, '15%'
        level 300_000, '20%'
        level 500_000, '25%'
        remainder '30%'
      end

      def level_category
        self_employed? ? :self_employed : :employee
      end
    end
  end
end
