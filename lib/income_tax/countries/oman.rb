module IncomeTax
  module Countries
    class Oman < Models::NoTaxes
      register 'Oman', 'OM', 'OMN'
      currency 'OMR'
    end
  end
end
