module IncomeTax
  module Countries
    class Kyrgyzstan < Models::FixedRate
      register "Kyrgyzstan", "KG", "KGZ"
      currency "KGS"
      rate     "10%"
    end
  end
end
