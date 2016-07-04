module IncomeTax
  module Countries
    class Jersey < Models::FixedRate
      register 'Jersey', 'JE', 'JEY'
      currency 'JEP'
      rate     '20%'
    end
  end
end
