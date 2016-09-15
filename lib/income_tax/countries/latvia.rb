module IncomeTax
  module Countries
    class Latvia < Models::FixedRate
      register 'Latvia', 'LV', 'LVA'
      currency 'EUR'
      rate     '24%'
    end
  end
end
