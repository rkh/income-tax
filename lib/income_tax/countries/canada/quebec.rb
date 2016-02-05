module IncomeTax
  module Countries
    class Canada
      class Quebec < Territory
        register "Quebec", "Québec", "QC"

        level 42390,  "16%"
        level 84780,  "20%"
        level 103150, "24%"
        remainder     "25.75%"
      end
    end
  end
end
