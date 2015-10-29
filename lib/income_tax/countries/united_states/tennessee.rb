module IncomeTax
  module Countries
    class UnitedStates
      class Tennessee < State
        register "Tennessee", "TN"
        no_tax
      end
    end
  end
end
