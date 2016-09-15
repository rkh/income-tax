module IncomeTax
  module Countries
    class Andorra < Models::FixedRate
      register 'Andorra', 'AD', 'AND'
      currency 'EUR'
      rate '10%'
    end
  end
end
