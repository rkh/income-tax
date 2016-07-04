module IncomeTax
  module Countries
    class Honduras < Models::FixedRate
      register 'Honduras', 'HN', 'HND'
      currency 'HNL'
      rate     '10%'
    end
  end
end
