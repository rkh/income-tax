module IncomeTax
  module Countries
    class Ukraine < Models::FixedRate
      register "Ukraine", "UA", "UKR"
      currency "UAH"
      rate     "15%"
    end
  end
end
