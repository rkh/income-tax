module IncomeTax
  module Countries
    class Bolivia < Models::FixedRate
      register 'Bolivia', 'Bolivia (Plurinational State of)', 'BO', 'BOL'
      currency 'BOB'
      rate '13%'
    end
  end
end
