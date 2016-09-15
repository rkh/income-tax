module IncomeTax
  module Countries
    class Georgia < Models::FixedRate
      register 'Georgia', 'GE', 'GEO'
      currency 'GEL'
      rate '20%'
    end
  end
end
