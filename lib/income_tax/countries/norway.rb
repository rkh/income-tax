module IncomeTax
  module Countries
    class Norway < Models::Progressive
      register 'Norway', 'NO', 'NOR'
      currency 'NOK'

      fixed = Rate.new('25%')
      level 159_800, fixed
      level 224_900, fixed + Rate.new('0.44%')
      level 565_400, fixed + Rate.new('1.7%')
      level 909_500, fixed + Rate.new('10.7%')
      remainder      fixed + Rate.new('13.7%')
    end
  end
end
