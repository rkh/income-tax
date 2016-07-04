module IncomeTax
  module Countries
    class CongoRepublic < Models::Progressive
      register 'Congo (Republic of the)', 'Congo, Republic of the', 'CG', 'COG'
      currency 'XAF'

      level 464_000, '1%'
      level 1_000_000, '10%'
      level 3_000_000, '25%'
      level 8_000_000, '40%'
      remainder '45%'
    end
  end
end
