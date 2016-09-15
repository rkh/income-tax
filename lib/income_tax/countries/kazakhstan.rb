module IncomeTax
  module Countries
    class Kazakhstan < Models::FixedRate
      register 'Kazakhstan', 'KZ', 'KAZ'
      currency 'KZT'
      rate     '10%'
    end
  end
end
