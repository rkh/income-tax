module IncomeTax
  module Countries
    class Bulgaria < Models::FixedRate
      register "Bulgaria", "BG", "BGR"
      currency "BGN"
      rate     "10%"
    end
  end
end
