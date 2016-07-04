module IncomeTax
  module Countries
    class Argentina < Models::Progressive
      register 'Argentina', 'AR', 'ARG'
      currency 'ARS'

      level 10_000,  '9%'
      level 20_000,  '14%'
      level 30_000,  '19%'
      level 60_000,  '23%'
      level 90_000,  '27%'
      level 120_000, '31%'
      remainder '35%'
    end
  end
end
