module IncomeTax
  module Countries
    class UnitedStates
      class NorthCarolina < State
        register 'North Carolina', 'NC'
        flat_rate '5.8%'
      end
    end
  end
end
