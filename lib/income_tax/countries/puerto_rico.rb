module IncomeTax
  module Countries
    class PuertoRico < Models::FixedRate
      register 'Puerto Rico', 'PR', 'PRI'
      currency 'USD'
      rate     '4%'
    end
  end
end
