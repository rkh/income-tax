module IncomeTax
  module Countries
    class Kiribati < Models::FixedRate
      register "Kiribati", "KI", "KIR"
      currency "AUD"
      rate     "30%"
    end
  end
end
