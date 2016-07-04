module IncomeTax
  module Countries
    class Lithuania < Models::FixedRate
      register 'Lithuania', 'LT', 'LTU'
      currency 'EUR'
      rate     '15%'
    end
  end
end
