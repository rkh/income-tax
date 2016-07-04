require 'income_tax/countries/france'

module IncomeTax
  module Countries
    class FrenchGuiana < Models::Delegate(France)
      register 'French Guiana', 'GF', 'GUF'
      currency 'EUR'
    end
  end
end
