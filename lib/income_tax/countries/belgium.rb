module IncomeTax
  module Countries
    class Belgium < Models::Progressive
      register "Belgium", "BE", "BEL"
      currency "EUR"

      level 8680,  "25%"
      level 12360, "30%"
      level 20600, "40%"
      level 37750, "45%"
      remainder "50%"
    end
  end
end
