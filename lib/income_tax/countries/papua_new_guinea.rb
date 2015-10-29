module IncomeTax
  module Countries
    class PapuaNewGuinea < Models::Progressive
      register "Papua New Guinea", "PG", "PNG"
      currency "PGK"

      level 10000,  "0%"
      level 18000,  "22%"
      level 33000,  "30%"
      level 70000,  "35%"
      level 250000, "40%"
      remainder     "42%"
    end
  end
end
