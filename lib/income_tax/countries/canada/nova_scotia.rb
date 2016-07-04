module IncomeTax
  module Countries
    class Canada
      class NovaScotia < Territory
        register 'Nova Scotia', 'NS'

        level offset(29_590), '8.79%'
        level offset(29_590), '14.95%'
        level offset(33_820), '16.67%'
        level offset(57_000), '17.5%'
        remainder '21%'
      end
    end
  end
end
