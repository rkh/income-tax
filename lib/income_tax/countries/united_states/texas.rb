module IncomeTax
  module Countries
    class UnitedStates
      class Texas < State
        register 'Texas', 'TX'
        no_tax
      end
    end
  end
end
