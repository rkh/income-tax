module IncomeTax
  module Countries
    class UnitedStates
      class State < Models::Progressive
        register_on StateRegister
        wants_options :married

        def self.deduct_federal
          @deduct_federal = true
        end

        def self.deduct_federal?
          @deduct_federal ||= false
        end

        def self.no_tax
          flat_rate '0%'
        end

        def self.flat_rate(rate)
          remainder rate
        end

        def level_category
          if self.class.levels.include? :default
            :default
          else
            married? ? :couple : :single
          end
        end
      end
    end
  end
end
