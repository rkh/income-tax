module IncomeTax
  module Countries
    class Montserrat < Models::Progressive
      register 'Montserrat', 'MS', 'MSR'
      currency 'XCD'

      level offset(5000),   '5%'
      level offset(5000),   '15%'
      level offset(5000),   '25%'
      level offset(120_000), '30%'
      remainder '40%'
    end
  end
end
