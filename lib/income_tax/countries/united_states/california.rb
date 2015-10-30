module IncomeTax
  module Countries
    class UnitedStates
      class California < State
        register "California", "CA"

        levels :single do
          standard_deduction = 3906
          level standard_deduction + 0,       "0%"
          level standard_deduction + 7582,    "1%"
          level standard_deduction + 17976,   "2%"
          level standard_deduction + 28371,   "4%"
          level standard_deduction + 39384,   "6%"
          level standard_deduction + 49774,   "8%"
          level standard_deduction + 254250,  "9.3%"
          level standard_deduction + 305100,  "10.3%"
          level standard_deduction + 508500,  "11.3%"
          level standard_deduction + 1000000, "12.3%"
          remainder                           "13.3%"
        end

        levels :couple do
          standard_deduction = 7812
          level standard_deduction + 0,       "0%"
          level standard_deduction + 15174,   "1%"
          level standard_deduction + 35952,   "2%"
          level standard_deduction + 46346,   "4%"
          level standard_deduction + 57359,   "6%"
          level standard_deduction + 67751,   "8%"
          level standard_deduction + 345780,  "9.3%"
          level standard_deduction + 414936,  "10.3%"
          level standard_deduction + 691560,  "11.3%"
          level standard_deduction + 1000000, "12.3%"
          remainder                           "13.3%"
        end
      end
    end
  end
end
