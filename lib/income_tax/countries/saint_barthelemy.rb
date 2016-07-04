module IncomeTax
  module Countries
    class SaintBarthelemy < Models::NoTaxes
      register 'Saint Barthélemy', 'BL', 'BLM'
      currency 'EUR'
    end
  end
end
