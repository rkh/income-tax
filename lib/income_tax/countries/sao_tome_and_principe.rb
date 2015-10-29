module IncomeTax
  module Countries
    class SaoTomeAndPrincipe < Models::FixedRate
      register "Sao Tome and Principe", "Sao Tome", "Principe", "ST", "STP"
      currency "STD"
      rate     "13%"
    end
  end
end
