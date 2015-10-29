module IncomeTax
  module Countries
    class UnitedStates
      class Colorado < State
        register "Colorado", "CO"
        flat_rate "4.63%"
      end
    end
  end
end
