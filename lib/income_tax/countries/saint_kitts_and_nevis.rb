module IncomeTax
  module Countries
    class SaintKittsAndNevis < Models::NoTaxes
      register 'Saint Kitts And Nevis', 'Saint Kitts', 'Nevis', 'KN', 'KNA'
      currency 'XCD'
    end
  end
end
