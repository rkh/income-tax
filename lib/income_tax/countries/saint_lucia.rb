module IncomeTax
  module Countries
    class SaintLucia < Models::Progressive
      register "Saint Lucia", "LC", "LCA"
      currency "XCD"

      level offset(18000), "0%"
      level offset(10000), "10%"
      level offset(10000), "15%"
      level offset(10000), "20%"
      remainder            "30%"
    end
  end
end
