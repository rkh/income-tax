module IncomeTax
  module Countries
    class Congo < Models::FixedRate
      register "Congo", "Congo, Democratic Republic of the", "Congo (Democratic Republic of the)", "CD", "COD"
      currency "CDF"
      rate     "30%"
    end
  end
end
