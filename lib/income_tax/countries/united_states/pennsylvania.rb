module IncomeTax
  module Countries
    class UnitedStates
      class Pennsylvania < State
        register "Pennsylvania", "PA"
        flat_rate "3.07%"
      end
    end
  end
end
