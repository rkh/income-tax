module IncomeTax
  module Countries
    class Maldives < Models::NoTaxes
      register 'Maldives', 'MV', 'MDV'
      currency 'MVR'
    end
  end
end
