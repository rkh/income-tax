module IncomeTax
  module Countries
    class Canada
      class Ontario < Territory
        register 'Ontario', 'ON'

        level offset(41_536),  '5.05%'
        level offset(41_539),  '9.15%'
        level offset(66_925),  '11.16%'
        level offset(70_000),  '12.16%'
        remainder '13.16%'
      end
    end
  end
end
