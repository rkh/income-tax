module IncomeTax
  module Countries
    class Brunei < Models::NoTaxes
      register 'Brunei Darussalam', 'Brunei', 'BN', 'BRN'
      currency 'BND'
    end
  end
end
