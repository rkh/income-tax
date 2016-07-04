require 'income_tax/countries/norway'

module IncomeTax
  module Countries
    class BouvetIsland < Models::Delegate(Norway)
      register 'Bouvet Island', 'BV', 'BVT'
      currency 'NOK'
    end
  end
end
