module IncomeTax
  module Countries
    class UnitedStates
      class Massachusetts < State
        register "Massachusetts", "MA"
        flat_rate "5.15%"
      end
    end
  end
end
