module IncomeTax
  module Countries
    class SolomonIslands < Models::Progressive
      register 'Solomon Islands', 'SB', 'SLB'
      currency 'SBD'

      allowance = 15_080

      level allowance,          '0%'
      level allowance + 15_000, '11%'
      level allowance + 30_000, '23%'
      level allowance + 60_000, '35%'
      remainder '40%'
    end
  end
end
