module IncomeTax
  module Countries
    class Romania < Models::FixedRate
      register "Romania", "RO", "ROU"
      currency "RON"
      rate "16%"
    end
  end
end
