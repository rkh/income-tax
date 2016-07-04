module IncomeTax
  module Countries
    class Turkmenistan < Models::FixedRate
      register 'Turkmenistan', 'TM', 'TKM'
      currency 'TMT'
      rate     '10%'
    end
  end
end
