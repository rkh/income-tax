module IncomeTax
  module Countries
    class FrenchPolynesia < Models::NoTaxes
      register 'French Polynesia', 'PF', 'PYF'
      currency 'XPF'
    end
  end
end
