module IncomeTax
  module Countries
    class Zambia < Models::Progressive
      register 'Zambia', 'ZM', 'ZMB'
      currency 'ZMW'

      level 29_460, '0%'
      level 39_060, '25%'
      level 73_860, '30%'
      remainder     '35%'
    end
  end
end
