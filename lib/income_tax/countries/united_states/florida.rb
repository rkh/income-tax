module IncomeTax
  module Countries
    class UnitedStates
      class Florida < State
        register "Florida", "FL"
        no_tax
      end
    end
  end
end
