module IncomeTax
  module Countries
    # While there is an income tax in Afghanistan, it's paid by the employer,
    # not the employee.
    class Afghanistan < Models::NoTaxes
      register 'Afghanistan', 'AF', 'AFG'
      currency 'AFN'
    end
  end
end
