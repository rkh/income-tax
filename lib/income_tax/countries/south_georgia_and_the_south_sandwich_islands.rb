require 'income_tax/countries/united_kingdom'

module IncomeTax
  module Countries
    class SouthGeorgiaAndTheSouthSandwichIslands < Models::Delegate(UnitedKingdom)
      register 'South Georgia and the South Sandwich Islands', 'South Georgia', 'South Sandwich Islands', 'GS', 'SGS'
      currency 'GBP'
    end
  end
end
