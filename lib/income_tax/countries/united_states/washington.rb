module IncomeTax
  module Countries
    class UnitedStates
      class Washington < State
        register "Washington", "WA"
        no_tax
      end
    end
  end
end
