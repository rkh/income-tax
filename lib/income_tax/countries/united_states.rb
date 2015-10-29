module IncomeTax
  module Countries
    class UnitedStates < Models::Generic
      register "United States", "United States of America", "USA", "US"
      currency "USD"

      wants_options :married, :joint_statement, :head_of_household, :state

      def setup(**options)
        @federal = Federal.new(**options)

        if state?
          factory = StateRegister[state]

          if factory.deduct_federal?
            options[:income]      = @federal.net_income
            options[:income_type] = :gross
          end

          @state = factory.new(**options)
        end
      end

      def state_taxes
        return 0 unless state?
        @state.taxes
      end

      def federal_taxes
        @federal.taxes
      end

      def calculate
        @taxes = federal_taxes + state_taxes
      end

      StateRegister = Register.new("state")
      require 'income_tax/countries/united_states/federal'
      require 'income_tax/countries/united_states/state'
      require 'income_tax/countries/united_states/alabama'
      require 'income_tax/countries/united_states/alaska'
      require 'income_tax/countries/united_states/arizona'
      require 'income_tax/countries/united_states/arkansas'
      require 'income_tax/countries/united_states/california'
      require 'income_tax/countries/united_states/colorado'
      require 'income_tax/countries/united_states/connecticut'
      require 'income_tax/countries/united_states/dc'
      require 'income_tax/countries/united_states/delaware'
      require 'income_tax/countries/united_states/florida'
      require 'income_tax/countries/united_states/georgia'
      require 'income_tax/countries/united_states/hawaii'
      require 'income_tax/countries/united_states/idaho'
      require 'income_tax/countries/united_states/illinois'
      require 'income_tax/countries/united_states/indiana'
      require 'income_tax/countries/united_states/iowa'
      require 'income_tax/countries/united_states/kansas'
      require 'income_tax/countries/united_states/kentucky'
      require 'income_tax/countries/united_states/louisiana'
      require 'income_tax/countries/united_states/maine'
      require 'income_tax/countries/united_states/maryland'
      require 'income_tax/countries/united_states/massachusetts'
      require 'income_tax/countries/united_states/michigan'
      require 'income_tax/countries/united_states/minnesota'
      require 'income_tax/countries/united_states/mississippi'
      require 'income_tax/countries/united_states/missouri'
      require 'income_tax/countries/united_states/montana'
      require 'income_tax/countries/united_states/nebraska'
      require 'income_tax/countries/united_states/nevada'
      require 'income_tax/countries/united_states/new_hampshire'
      require 'income_tax/countries/united_states/new_jersey'
      require 'income_tax/countries/united_states/new_mexico'
      require 'income_tax/countries/united_states/new_york'
      require 'income_tax/countries/united_states/north_carolina'
      require 'income_tax/countries/united_states/north_dakota'
      require 'income_tax/countries/united_states/ohio'
      require 'income_tax/countries/united_states/oklahoma'
      require 'income_tax/countries/united_states/oregon'
      require 'income_tax/countries/united_states/pennsylvania'
      require 'income_tax/countries/united_states/rhode_island'
      require 'income_tax/countries/united_states/south_carolina'
      require 'income_tax/countries/united_states/south_dakota'
      require 'income_tax/countries/united_states/tennessee'
      require 'income_tax/countries/united_states/texas'
      require 'income_tax/countries/united_states/utah'
      require 'income_tax/countries/united_states/vermont'
      require 'income_tax/countries/united_states/virginia'
      require 'income_tax/countries/united_states/washington'
      require 'income_tax/countries/united_states/west_virginia'
      require 'income_tax/countries/united_states/wisconsin'
      require 'income_tax/countries/united_states/wyoming'
    end
  end
end
