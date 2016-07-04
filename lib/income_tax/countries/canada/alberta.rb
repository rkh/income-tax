module IncomeTax
  module Countries
    class Canada
      class Alberta < Territory
        register 'Alberta', 'AB'

        level offset(125_000), '10%'
        level offset(25_000),  '12%'
        level offset(50_000),  '13%'
        level offset(100_000), '14%'
        remainder '15%'
      end
    end
  end
end
