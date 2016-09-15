module IncomeTax
  module Countries
    class FalklandIslands < Models::Progressive
      register 'Falkland Islands (Malvinas)', 'Falkland Islands', 'Malvinas', 'FK', 'FLK'
      currency 'FKP'

      level 15_000, '0%'
      level 27_000, '21%'
      remainder     '26%'
    end
  end
end
