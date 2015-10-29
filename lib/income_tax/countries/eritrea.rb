module IncomeTax
  module Countries
    class Eritrea < Models::FixedRate
      register "Eritrea", "ER", "ERI"
      currency "ETB"
      rate     "34%"
    end
  end
end
