module IncomeTax
  module Countries
    class Niger < Models::Progressive
      register "Niger", "NE", "NER"
      currency "XOF"

      level "30000",  "0%"
      level "50000",  "12.10%"
      level "80000",  "13.9%"
      level "120000", "15.7%"
      level "170000", "18.4%"
      level "250000", "21.7%"
      remainder "25%"
    end
  end
end
