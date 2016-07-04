module IncomeTax
  module Countries
    class Venezuela < Models::Progressive
      register 'Venezuela', 'Venezuela (Bolivarian Republic of)', 'VE', 'VEN'
      currency 'VEF'

      tax_unit  = 127
      deduction = tax_unit * 774

      level tax_unit * 1000 + deduction, '6%'
      level tax_unit * 1500 + deduction, '9%'
      level tax_unit * 2000 + deduction, '12%'
      level tax_unit * 2500 + deduction, '16%'
      level tax_unit * 3000 + deduction, '20%'
      level tax_unit * 4000 + deduction, '24%'
      level tax_unit * 6000 + deduction, '29%'
      remainder '34%'
    end
  end
end
