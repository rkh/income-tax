module IncomeTax
  module Countries
    class Canada
      class NorthwestTerritories < Territory
        register 'Northwest Territories', 'NT'

        level offset(41_011), '5.9%'
        level offset(41_013), '8.6%'
        level offset(51_329), '12.2%'
        remainder '14.05%'
      end
    end
  end
end
