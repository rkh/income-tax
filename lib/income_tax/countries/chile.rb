module IncomeTax
  module Countries
    class Chile < Models::Progressive
      register 'Chile', 'CL', 'CHL'
      currency 'CLP'

      # this is adjusted monthly but usually between 35k and 40k
      unit = 40_000 * 12

      level 13.5 * unit, '0%'
      level 30   * unit, '5%'
      level 50   * unit, '10%'
      level 70   * unit, '15%'
      level 90   * unit, '25%'
      level 120  * unit, '32%'
      level 150  * unit, '37%'
      remainder '40%'
    end
  end
end
