require 'income_tax/countries/finland'

module IncomeTax
  module Countries
    class Aland < Models::Delegate(Finland)
      register 'Åland Islands', 'Åland', 'Ahvenanmaa', 'AX', 'ALA'
      currency 'EUR'
    end
  end
end
