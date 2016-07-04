module IncomeTax
  module Countries
    class CapeVerde < Models::Progressive
      register 'Cape Verde', 'Cabo Verde', 'CV', 'CPV'
      currency 'CVE'

      level 385_000,  '15%'
      level 810_000,  '20%'
      level 1_620_000, '27.5%'
      level 2_430_000, '35%'
      remainder '45%'
    end
  end
end
