module IncomeTax
  module Countries
    class Nauru < Models::NoTaxes
      register "Nauru", "NR", "NRU"
      currency "AUD"
    end
  end
end
