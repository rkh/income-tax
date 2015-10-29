module IncomeTax
  module Countries
    class Mauritius < Models::FixedRate
      register "Mauritius", "MU", "MUS"
      currency "MUR"
      rate     "15%"
    end
  end
end
