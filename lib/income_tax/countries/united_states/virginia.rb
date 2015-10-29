module IncomeTax
  module Countries
    class UnitedStates
      class Virginia < State
        register "Virginia", "VA"

        standard_deduction = 930
        level standard_deduction + 0,         "5.75%"
        level standard_deduction + 3000,      "2%"
        level standard_deduction + 5000,      "3%"
        level standard_deduction + 17000,     "5%"
        remainder                             "5.75%"
      end
    end
  end
end
