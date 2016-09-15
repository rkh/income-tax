module IncomeTax
  module Countries
    class Vatican < Models::NoTaxes
      register 'Holy See (Vatican City State)', 'Holy See', 'Vatican', 'Vatican City', 'VA', 'VAT'
      currency 'EUR'
    end
  end
end
