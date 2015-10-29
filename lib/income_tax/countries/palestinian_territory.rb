module IncomeTax
  module Countries
    # TODO: Some people might actually pay tax in Israel
    class PalestinianTerritory < Models::Progressive
      register "Palestinian Territory", "Palestine", "Palestinian Territory, Occupied", "Palestine, State of", "PS", "PSE"
      currency "ILS"

      level  30_000, "0%"
      level  70_000, "5%"
      level 110_000, "10%"
      level 155_000, "15%"
      remainder      "20%"
    end
  end
end
