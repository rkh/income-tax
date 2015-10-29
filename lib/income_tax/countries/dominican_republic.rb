module IncomeTax
  module Countries
    class DominicanRepublic < Models::Progressive
      register "Dominican Republic", "DO", "DOM"
      currency "DOP"

      level 399923, "0%"
      level 599884, "15%"
      level 833171, "20%"
      remainder     "25%"
    end
  end
end
