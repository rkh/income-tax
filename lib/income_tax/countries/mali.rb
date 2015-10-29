module IncomeTax
  module Countries
    class Mali < Models::FixedRate
      register "Mali", "ML", "MLI"
      currency "XOF"
      rate     "3%" # or 30%, you choose!
    end
  end
end
