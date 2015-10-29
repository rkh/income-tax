module IncomeTax
  module Countries
    class Bahrain < Models::NoTaxes
      register "Bahrain", "BH", "BHR"
      currency "BHD"
    end
  end
end
