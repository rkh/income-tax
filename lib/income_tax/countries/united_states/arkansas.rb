module IncomeTax
  module Countries
    class UnitedStates
      class Arkansas < State
        register "Arkansas", "AR"

        levels :single do
          level 2000,  "0%"
          level 6199,  "1%"
          level 10299, "2.5%"
          level 14399, "3.5%"
          level 22699, "4.5%"
          level 36599, "6%"
          remainder    "7%"
        end

        levels :couple do
          level 4000,  "0%"
          level 8199,  "1%"
          level 12299, "2.5%"
          level 16399, "3.5%"
          level 24699, "4.5%"
          level 38599, "6%"
          remainder    "7%"
        end
      end
    end
  end
end
