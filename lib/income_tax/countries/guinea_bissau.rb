module IncomeTax
  module Countries
    class GuineaBissau < Models::FixedRate
      register "Guinea-Bissau", "GW", "GNB"
      currency "XOF"
      rate     "20%"
    end
  end
end
