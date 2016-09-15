module IncomeTax
  module Countries
    class Guernsey < Models::FixedRate
      register 'Guernsey', 'GG', 'GGY'
      currency 'GGP'
      rate     '20%'
    end
  end
end
