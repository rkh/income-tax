module IncomeTax
  module Countries
    class TrinidadAndTobago < Models::Progressive
      register 'Trinidad And Tobago', 'TT', 'TTO'
      currency 'TTD'

      level 60_000, '0%'
      remainder '25%'
    end
  end
end
