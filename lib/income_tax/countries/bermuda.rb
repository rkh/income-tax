module IncomeTax
  module Countries
    class Bermuda < Models::NoTaxes
      register "Bermuda", "BM", "BMU"
      currency "BMD"
    end
  end
end
