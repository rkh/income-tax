module IncomeTax
  module Countries
    class Albania < Models::Progressive
      register 'Albania', 'AL', 'ALB'
      currency 'ALL'

      level 30_000,  '0%'
      level 130_000, '13%'
      remainder '23%'
    end
  end
end
