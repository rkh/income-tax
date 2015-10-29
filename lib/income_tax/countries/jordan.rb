module IncomeTax
  module Countries
    class Jordan < Models::Progressive
      register "Jordan", "JO", "JOR"
      currency "JOD"

      # TODO: 12,000 allowance per dependent
      level 12000, "0%"
      level 22000, "7%"
      level 32000, "14%"
      remainder    "20%"
    end
  end
end
