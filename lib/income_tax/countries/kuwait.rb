module IncomeTax
  module Countries
    class Kuwait < Models::NoTaxes
      register 'Kuwait', 'KW', 'KWT'
      currency 'KWD'
    end
  end
end
