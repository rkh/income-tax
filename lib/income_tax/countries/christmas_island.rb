module IncomeTax
  module Countries
    class ChristmasIsland < Models::NoTaxes
      register 'Christmas Island', 'CX', 'CXR'
      currency 'AUD'
    end
  end
end
