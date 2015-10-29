module IncomeTax
  module Countries
    class WallisAndFutuna < Models::NoTaxes
      register "Wallis and Futuna", "Wallis", "Futuna", "WF", "WLF"
      currency "XPF"
    end
  end
end
