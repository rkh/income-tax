module IncomeTax
  module Countries
    class Vanuatu < Models::NoTaxes
      register 'Vanuatu', 'VU', 'VUT'
      currency 'VUV'
    end
  end
end
