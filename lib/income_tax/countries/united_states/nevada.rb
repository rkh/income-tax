module IncomeTax
  module Countries
    class UnitedStates
      class Nevada < State
        register 'Nevada', 'NV'
        no_tax
      end
    end
  end
end
