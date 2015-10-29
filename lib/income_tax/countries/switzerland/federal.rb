module IncomeTax
  module Countries
    class Switzerland
      class Federal < Models::Progressive
        wants_options :married, :children

        levels :a do
          level  14_500, "0%"
          level  31_600, "0.77%"
          level  41_400, "0.88%"
          level  55_200, "2.64%"
          level  72_500, "2.97%"
          level  78_100, "5.94%"
          level 103_600, "6.60%"
          level 134_600, "8.80%"
          level 176_000, "11.00%"
          level 755_200, "13.2%"
          remainder      "11.5%"
        end

        levels :b do
          level  28_300, "0%"
          level  50_900, "1%"
          level  58_400, "2%"
          level  75_300, "3%"
          level  90_300, "4%"
          level 103_400, "5%"
          level 114_700, "6%"
          level 124_200, "7%"
          level 131_700, "8%"
          level 137_300, "9%"
          level 141_200, "10%"
          level 143_100, "11%"
          level 145_000, "12%"
          level 895_800, "13%"
          remainder      "11.5%"
        end

        def level_category
          return :b if married?
          children > 0 ? :b : :a
        end
      end
    end
  end
end
