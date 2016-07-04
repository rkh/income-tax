module IncomeTax
  module Countries
    class Canada
      class Yukon < Territory
        register 'Yukon', 'YT'

        level offset(45_282),  '6.4%'
        level offset(45_281),  '9%'
        level offset(49_825),  '10.9%'
        level offset(359_612), '12.8%'
        remainder '15%'
      end
    end
  end
end
