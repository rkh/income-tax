module IncomeTax
  module Countries
    class Iraq < Models::FixedRate
      register "Iraq", "IQ", "IRQ"
      currency "IQD"
      rate     "15%"
    end
  end
end
