module IncomeTax
  module Countries
    class Qatar < Models::NoTaxes
      register 'Qatar', 'QA', 'QAT'
      currency 'QAR'
    end
  end
end
