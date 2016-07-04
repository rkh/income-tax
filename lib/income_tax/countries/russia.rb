module IncomeTax
  module Countries
    class Russia < Models::FixedRate
      register 'Russia', 'Russian Federation', 'RU', 'RUS'
      currency 'RUB'
      rate '13%'
    end
  end
end
