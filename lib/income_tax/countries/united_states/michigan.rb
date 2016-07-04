module IncomeTax
  module Countries
    class UnitedStates
      class Michigan < State
        register 'Michigan', 'MI'
        flat_rate '4.25%'
      end
    end
  end
end
