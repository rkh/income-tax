module IncomeTax
  module Countries
    class MarshallIslands < Models::Progressive
      register "Marshall Islands", "MH", "MHL"
      currency "USD"

      level 10400, "8%"
      remainder "12%"
    end
  end
end
