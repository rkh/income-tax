module IncomeTax
  module Countries
    class Bhutan < Models::Progressive
      register 'Bhutan', 'BT', 'BTN'
      currency 'BTN'

      level 100_000,  '0%'
      level 250_000,  '10%'
      level 500_000,  '15%'
      level 1_000_000, '20%'
      remainder '25%'
    end
  end
end
