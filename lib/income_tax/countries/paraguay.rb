module IncomeTax
  module Countries
    class Paraguay < Models::FixedRate
      register "Paraguay", "PY", "PRY"
      currency "PYG"
      rate "10%"
    end
  end
end
