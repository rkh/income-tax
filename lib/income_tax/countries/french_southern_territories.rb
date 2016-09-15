require 'income_tax/countries/france'

module IncomeTax
  module Countries
    class FrenchSouthernTerritories < Models::Delegate(France)
      register 'French Southern Territories', 'TF', 'ATF'
      currency 'EUR'
    end
  end
end
