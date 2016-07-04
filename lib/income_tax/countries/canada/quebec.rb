module IncomeTax
  module Countries
    class Canada
      class Quebec < Territory
        register 'Quebec', 'Québec', 'QC'

        level 42_390,  '16%'
        level 84_780,  '20%'
        level 103_150, '24%'
        remainder '25.75%'
      end
    end
  end
end
