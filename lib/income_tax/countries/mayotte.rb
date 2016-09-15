require 'income_tax/countries/france'

module IncomeTax
  module Countries
    class Mayotte < Models::Delegate(France)
      register 'Mayotte', 'Maore', 'YT', 'MYT'
      currency 'EUR'
    end
  end
end
