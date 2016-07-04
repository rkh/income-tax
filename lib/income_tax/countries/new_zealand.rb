module IncomeTax
  module Countries
    class NewZealand < Models::Progressive
      register 'New Zealand', 'NZ', 'NZL'
      currency 'NZD'

      level 14_000, '10.5%'
      level 48_000, '17.5%'
      level 70_000, '30%'
      remainder '33%'
    end
  end
end
