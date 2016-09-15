module IncomeTax
  module Countries
    class Kosovo < Models::Progressive
      register 'Kosovo', 'Kosovo (Disputed Territory)', 'XK', 'RKS'
      currency 'EUR'

      level 960,  '0%'
      level 3000, '4%'
      level 5400, '8%'
      remainder   '10%'
    end
  end
end
