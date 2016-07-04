require 'income_tax/countries/united_states'

module IncomeTax
  module Countries
    class UnitedStatesMinorOutlyingIslands < Models::Delegate(UnitedStates)
      register 'United States Minor Outlying Islands', 'UM', 'UMI'
      currency 'USD'
    end
  end
end
