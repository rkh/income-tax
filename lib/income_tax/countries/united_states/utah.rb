module IncomeTax
  module Countries
    class UnitedStates
      class Utah < State
        register "Utah", "UT"
        flat_rate "5%"
      end
    end
  end
end
