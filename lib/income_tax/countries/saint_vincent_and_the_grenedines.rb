module IncomeTax
  module Countries
    class SaintVincentAndTheGrenedines < Models::Progressive
      register 'Saint Vincent And The Grenedines', 'Saint Vincent', 'The Grenedines', 'VC', 'VCT'
      currency 'XCD'

      level 5000,  '12%'
      level 10_000, '20%'
      level 30_000, '30%'
      remainder '40%'
    end
  end
end
