module IncomeTax
  module Countries
    class Belarus < Models::FixedRate
      register "Belarus", "BY", "BLR"
      currency "BYR"
      rate "12%"
    end
  end
end
