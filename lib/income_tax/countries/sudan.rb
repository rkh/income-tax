module IncomeTax
  module Countries
    class Sudan < Models::FixedRate
      register "Sudan", "SD", "SDN"
      currency "SDG"
      rate     "15%"
    end
  end
end
