module IncomeTax
  module Countries
    class CzechRepublic < Models::FixedRate
      register 'Czech Republic', 'CZ', 'CZE'
      currency 'CZK'
      rate     '15%'
    end
  end
end
