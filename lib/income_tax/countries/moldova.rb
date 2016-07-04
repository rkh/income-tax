module IncomeTax
  module Countries
    class Moldova < Models::Progressive
      register 'Moldova', 'Moldova (Republic of)', 'MD', 'MDA'
      currency 'MDL'

      level 12_180, '0%'
      level 16_200, '10%'
      level 21_000, '15%'
      remainder '22%'
    end
  end
end
