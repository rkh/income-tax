module IncomeTax
  module Countries
    # TODO? French citizens have to pay taxes in France
    class Monaco < Models::NoTaxes
      register 'Monaco', 'MC', 'MCO'
      currency 'EUR'
    end
  end
end
