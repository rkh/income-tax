module IncomeTax
  module Countries
    class Grenada < Models::Progressive
      register 'Grenada', 'GD', 'GRD'
      currency 'XCD'

      level 60_000, '0%'
      remainder     '30%'
    end
  end
end
