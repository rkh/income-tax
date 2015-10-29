module IncomeTax
  module Countries
    class UnitedStates
      class NewHampshire < State
        register "New Hampshire", "NH"
        flat_rate "5%"
      end
    end
  end
end
