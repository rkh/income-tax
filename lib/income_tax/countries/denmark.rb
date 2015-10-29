module IncomeTax
  module Countries
    class Denmark < Models::Progressive
      register "Denmark", "DK", "DNK"
      currency "DKK"

      level 42800,  "8%"
      level 421000, "37%"
      remainder     "44%"
    end
  end
end
