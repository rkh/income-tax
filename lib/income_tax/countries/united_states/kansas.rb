module IncomeTax
  module Countries
    class UnitedStates
      class Kansas < State
        register "Kansas", "KS"

        levels :single do
          standard_deduction = 2250
          level standard_deduction + 0,         "0.00%"
          level standard_deduction + 15000,     "2.7%"
          remainder                             "4.80%"
        end

        levels :couple do
          standard_deduction = 2250
          level standard_deduction + 0,         "4.80%"
          level standard_deduction + 30000,     "2.70%"
          remainder                             "4.80%"
        end
      end
    end
  end
end
