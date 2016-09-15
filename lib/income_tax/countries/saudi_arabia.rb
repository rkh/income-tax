module IncomeTax
  module Countries
    class SaudiArabia < Models::NoTaxes
      register 'Saudi Arabia', 'SA', 'SAU'
      currency 'SAR'
    end
  end
end
