require 'income_tax/countries/australia'

module IncomeTax
  module Countries
    class HeardAndMcdonaldIslands < Models::Delegate(Australia)
      register "Heard and McDonald Islands", "Heard Island", "McDonald Island", "HM", "HMD"
      currency "AUD"
    end
  end
end
