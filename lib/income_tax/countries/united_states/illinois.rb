module IncomeTax
  module Countries
    class UnitedStates
      class Illinois < State
        register 'Illinois', 'IL'
        flat_rate '3.75%'
      end
    end
  end
end
