module IncomeTax
  module Countries
    class Switzerland < Models::Generic
      CantonRegister = Register.new('canton')

      register "Switzerland", "CH", "CHE"
      currency "CHF"

      wants_options :canton, :married, :children

      def setup(**options)
        @canton  = CantonRegister[options[:canton] || "ZH"].new(**options)
        @federal = Federal.new(**options)
      end

      def municipal_taxes
        @canton.municipal_multiplier * @canton.taxes
      end

      def cantonal_taxes
        @canton.cantonal_multiplier * @canton.taxes
      end

      def federal_taxes
        @federal.taxes
      end

      def calculate
        @taxes = federal_taxes + cantonal_taxes + municipal_taxes
      end

      require "income_tax/countries/switzerland/federal"
      require "income_tax/countries/switzerland/canton"
      require "income_tax/countries/switzerland/aargau"
      require "income_tax/countries/switzerland/appenzell_inner"
      require "income_tax/countries/switzerland/appenzell_outer"
      require "income_tax/countries/switzerland/basel_city"
      require "income_tax/countries/switzerland/basel_land"
      require "income_tax/countries/switzerland/bern"
      require "income_tax/countries/switzerland/fribourg"
      require "income_tax/countries/switzerland/geneva"
      require "income_tax/countries/switzerland/glarus"
      require "income_tax/countries/switzerland/grisons"
      require "income_tax/countries/switzerland/jura"
      require "income_tax/countries/switzerland/lucerne"
      require "income_tax/countries/switzerland/neuchatel"
      require "income_tax/countries/switzerland/nidwalden"
      require "income_tax/countries/switzerland/obwalden"
      require "income_tax/countries/switzerland/schaffhausen"
      require "income_tax/countries/switzerland/schwyz"
      require "income_tax/countries/switzerland/solothurn"
      require "income_tax/countries/switzerland/st_gallen"
      require "income_tax/countries/switzerland/thurgau"
      require "income_tax/countries/switzerland/ticino"
      require "income_tax/countries/switzerland/uri"
      require "income_tax/countries/switzerland/valais"
      require "income_tax/countries/switzerland/vaud"
      require "income_tax/countries/switzerland/zug"
      require "income_tax/countries/switzerland/zurich"
    end
  end
end
