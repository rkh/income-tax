module IncomeTax
  module Countries
    class Macedonia < Models::FixedRate
      register 'Macedonia', 'Macedonia (the former Yugoslav Republic of)', 'MK', 'MKD'
      currency 'MKD'
      rate     '10%'
    end
  end
end
