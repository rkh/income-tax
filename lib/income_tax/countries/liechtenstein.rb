module IncomeTax
  module Countries
    class Liechtenstein < Models::FixedRate
      register 'Liechtenstein', 'LI', 'LIE'
      currency 'CHF'
      rate     '17.82%'
    end
  end
end
