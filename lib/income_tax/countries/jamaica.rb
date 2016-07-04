module IncomeTax
  module Countries
    class Jamaica < Models::Progressive
      register 'Jamaica', 'JM', 'JAM'
      currency 'JMD'

      level 557_232, '0%'
      remainder '25%'
    end
  end
end
