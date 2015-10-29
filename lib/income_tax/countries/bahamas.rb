module IncomeTax
  module Countries
    class Bahamas < Models::NoTaxes
      register "Bahamas", "BS", "BHS"
      currency "BSD"
    end
  end
end
