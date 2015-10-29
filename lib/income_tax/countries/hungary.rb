module IncomeTax
  module Countries
    class Hungary < Models::FixedRate
      register "Hungary", "HU", "HUN"
      currency "HUF"
      rate     "16%"
    end
  end
end
