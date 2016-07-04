module IncomeTax
  module Countries
    class Mexico < Models::Progressive
      register 'Mexico', 'MX', 'MEX'
      currency 'MXN'

      level 5953, '1.92%'
      level 50_525,   '6.4%'
      level 88_794,   '10.88%'
      level 103_218,  '16%'
      level 123_581,  '17.2%'
      level 249_244,  '21.36%'
      level 392_842,  '23.52%'
      level 750_000,  '30%'
      level 1_000_000, '32%'
      level 3_000_000, '34%'
      remainder '35%'
    end
  end
end
