module IncomeTax
  module Countries
    class Haiti < Models::FixedRate
      register "Haiti", "HT", "HTI"
      currency "USD"
      rate     "20%"
    end
  end
end
