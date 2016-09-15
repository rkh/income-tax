module IncomeTax
  module Countries
    class Estonia < Models::FixedRate
      register 'Estonia', 'EE', 'EST'
      currency 'EUR'
      rate '20%'
    end
  end
end
