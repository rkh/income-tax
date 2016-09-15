module IncomeTax
  module Countries
    class Serbia < Models::Progressive
      register 'Serbia', 'RS', 'SRB'
      currency 'RSD'

      average_salary = 49_970
      level average_salary * 3, '10%'
      level average_salary * 6, '20%'
      remainder                 '35%'
    end
  end
end
