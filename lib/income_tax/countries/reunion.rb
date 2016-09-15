require 'income_tax/countries/france'

module IncomeTax
  module Countries
    class Reunion < Models::Delegate(France)
      register 'Réunion', 'RE', 'REU'
      currency 'EUR'
    end
  end
end
