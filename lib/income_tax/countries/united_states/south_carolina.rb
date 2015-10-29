module IncomeTax
  module Countries
    class UnitedStates
      class SouthCarolina < State
        register "South Carolina", "SC"

        standard_deduction = 3900
        level standard_deduction + 2880,      "0%"
        level standard_deduction + 5760,      "3%"
        level standard_deduction + 8640,      "4%"
        level standard_deduction + 11520,     "5%"
        level standard_deduction + 14400,     "6%"
        remainder                             "7%"
      end
    end
  end
end
