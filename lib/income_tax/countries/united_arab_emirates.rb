module IncomeTax
  module Countries
    class UnitedArabEmirates < Models::NoTaxes
      register 'United Arab Emirates', 'AE', 'ARE'
      currency 'AED'
    end
  end
end
