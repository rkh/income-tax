require 'income_tax/countries/united_states'

module IncomeTax
  module Countries
    class NorthernMarianaIslands < Models::Delegate(UnitedStates)
      register "Northern Mariana Islands", "MP", "MNP"
      currency "USD"
    end
  end
end
