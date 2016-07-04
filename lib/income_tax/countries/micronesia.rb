module IncomeTax
  module Countries
    class Micronesia < Models::FixedRate
      register 'Micronesia, Federated States Of', 'Micronesia', 'FM', 'FSM'
      currency 'USD'
      rate     '10%'
    end
  end
end
