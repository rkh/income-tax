module IncomeTax
  module Countries
    class Brazil < Models::Progressive
      register "Brazil", "BR", "BRA"
      currency "BRL"

      level "1787.77", "0%"
      level "2679.29", "7.5%"
      level "3572.43", "15%"
      level "4463.81", "22.5%"
      remainder "27.5%"
    end
  end
end
