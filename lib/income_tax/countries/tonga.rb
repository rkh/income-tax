module IncomeTax
  module Countries
    class Tonga < Models::Progressive
      register 'Tonga', 'TO', 'TON'
      currency 'TOP'

      level 7_400, '0%'
      level 30_000, '10%'
      remainder     '20%'
    end
  end
end
