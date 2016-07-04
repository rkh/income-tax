module IncomeTax
  module Countries
    class Rwanda < Models::Progressive
      register 'Rwanda', 'RW', 'RWA'
      currency 'RWF'

      level    360_000, '0%'
      level 12_000_000, '20%'
      remainder         '30%'
    end
  end
end
