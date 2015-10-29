require 'income_tax/countries/united_kingdom'

module IncomeTax
  module Countries
    class BritishIndianOceanTerritory < Models::Delegate(UnitedKingdom)
      register "British Indian Ocean Territory", "IO", "IOT"
      currency "USD"
    end
  end
end
