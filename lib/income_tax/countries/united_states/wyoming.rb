module IncomeTax
  module Countries
    class UnitedStates
      class Wyoming < State
        register "Wyoming", "WY"
        no_tax
      end
    end
  end
end
