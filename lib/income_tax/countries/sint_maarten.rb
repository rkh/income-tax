module IncomeTax
  module Countries
    class SintMaarten < Models::Progressive
      register 'Sint Maarten', 'SX', 'SXM'
      currency 'ANG'

      level 31_117,  '12.5%'
      level 46_676,  '20%'
      level 64_828,  '26.25%'
      level 97_239,  '33.75%'
      level 137_431, '40%'
      remainder      '47.5%'
    end
  end
end
