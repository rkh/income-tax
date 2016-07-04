module IncomeTax
  module Countries
    class Canada
      class Manitoba < Territory
        register 'Manitoba', 'MB'

        level offset(31_000), '10.8%'
        level offset(36_000), '12.75%'
        remainder '17.4%'
      end
    end
  end
end
