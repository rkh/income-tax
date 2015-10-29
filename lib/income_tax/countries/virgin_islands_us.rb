module IncomeTax
  module Countries
    class VirginIslandsUs < Models::Delegate(UnitedStates)
      register "Virgin Islands, U.S.", "Virgin Islands (U.S.)", "VI", "VIR"
      currency "USD"
    end
  end
end
