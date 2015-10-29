module IncomeTax
  module Countries
    class SriLanka < Models::FixedRate
      register "Sri Lanka", "LK", "LKA"
      currency "LKR"
      rate     "20%"
    end
  end
end
