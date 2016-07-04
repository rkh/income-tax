module IncomeTax
  module Countries
    class UnitedStates
      class Alaska < State
        register 'Alaska', 'AK'
        no_tax
      end
    end
  end
end
