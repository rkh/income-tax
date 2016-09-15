module IncomeTax
  module Countries
    class NorthKorea < Models::NoTaxes
      register "Korea, Democratic People's Republic Of", 'Korea (North)', 'North Korea', "Korea (Democratic People's Republic Of)", 'KP', 'PRK'
      currency 'KPW'
    end
  end
end
