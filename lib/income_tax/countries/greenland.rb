module IncomeTax
  module Countries
    class Greenland < Models::FixedRate
      register 'Greenland', 'GL', 'GRL'
      currency 'DKK'
      rate     '37%'
    end
  end
end
