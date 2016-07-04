module IncomeTax
  module Countries
    class SvalbardAndJanMayen < Models::FixedRate
      register 'Svalbard And Jan Mayen', 'Svalbard', 'Jan Mayen', 'SJ', 'SJM'
      currency 'NOK'
      rate     '6%'
    end
  end
end
