module IncomeTax
  module Countries
    class ElSalvador < Models::FixedRate
      register "El Salvador", "SV", "SLV"
      currency "USD"
      rate     "25%"
    end
  end
end
