module IncomeTax
  module Countries
    class Canada < Models::Generic
      register "Canada", "CA", "CAN"
      currency "CAD"

      wants_options :territory

      def setup(**options)
        @federal   = Federal.new(**options)
        @territory = TerritoryRegister[territory].new(**options) if territory?
      end

      def territorial_taxes
        return 0 unless territory?
        @territory.taxes
      end

      def federal_taxes
        @federal.taxes
      end

      def calculate
        @taxes = federal_taxes + territorial_taxes
      end

      TerritoryRegister = Register.new("territory")
      Territory         = Class.new(Models::Progressive) { register_on TerritoryRegister }

      require 'income_tax/countries/canada/federal'
      require 'income_tax/countries/canada/alberta'
      require 'income_tax/countries/canada/british_columbia'
      require 'income_tax/countries/canada/manitoba'
      require 'income_tax/countries/canada/new_brunswick'
      require 'income_tax/countries/canada/newfoundland_and_labrador'
      require 'income_tax/countries/canada/northwest_territories'
      require 'income_tax/countries/canada/nova_scotia'
      require 'income_tax/countries/canada/nunavut'
      require 'income_tax/countries/canada/ontario'
      require 'income_tax/countries/canada/prince_edward_island'
      require 'income_tax/countries/canada/quebec'
      require 'income_tax/countries/canada/saskatchewan'
      require 'income_tax/countries/canada/yukon'
    end
  end
end
