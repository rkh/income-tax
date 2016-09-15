module IncomeTax
  module Countries
    class Samoa < Models::Progressive
      register 'Samoa', 'WS', 'WSM'
      currency 'WST'

      level 12_000, '0%'
      level 15_000, '10%'
      level 20_000, '20%'
      remainder     '27%'
    end
  end
end
