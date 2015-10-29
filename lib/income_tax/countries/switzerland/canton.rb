module IncomeTax
  module Countries
    class Switzerland
      class Canton < Models::Progressive
        wants_options :married, :children
        register_on CantonRegister

        def self.cantonal_multiplier(value = nil)
          @cantonal_multiplier = Rate(value) if value
          @cantonal_multiplier ||= Rate("100%")
        end

        def self.municipal_multiplier(value = nil)
          @municipal_multiplier = Rate(value) if value
          @municipal_multiplier ||= Rate("100%")
        end

        def level_category
          prefix = married? ? :B : :A
          count  = children > 9 ? 9 : 0
          :"#{prefix}#{count}"
        end

        def cantonal_multiplier
          self.class.cantonal_multiplier
        end

        def municipal_multiplier
          self.class.municipal_multiplier
        end

        public :municipal_multiplier, :cantonal_multiplier
      end
    end
  end
end
