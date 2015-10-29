module IncomeTax
  module Countries
    class Moldova < Models::Progressive
      register "Moldova", "Moldova (Republic of)", "MD", "MDA"
      currency "MDL"

      level 12180, "0%"
      level 16200, "10%"
      level 21000, "15%"
      remainder "22%"
    end
  end
end
