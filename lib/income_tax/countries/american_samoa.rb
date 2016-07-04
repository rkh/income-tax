require 'income_tax/countries/united_states'

module IncomeTax
  module Countries
    class AmericanSamoa < Models::Delegate(UnitedStates)
      register 'American Samoa', 'AS', 'ASM'
      currency 'USD'
    end
  end
end
