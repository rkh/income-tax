module IncomeTax
  module Countries
    class WesternSahara < Models::NoTaxes
      register 'Western Sahara', 'EH', 'ESH'
      currency 'MAD'
    end
  end
end
