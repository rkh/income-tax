module IncomeTax
  module Countries
    class Slovakia < Models::Progressive
      register "Slovakia", "SK", "SVK"
      currency "EUR"

      level 34401, "19%"
      remainder    "25%"
    end
  end
end
