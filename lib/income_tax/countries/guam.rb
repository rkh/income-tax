require 'income_tax/countries/united_states'

module IncomeTax
  module Countries
    class Guam < Models::Delegate(UnitedStates)
      register "Guam", "GU", "GUM"
      currency "USD"
    end
  end
end
