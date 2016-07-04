module IncomeTax
  module Countries
    class TurksAndCaicosIslands < Models::NoTaxes
      register 'Turks and Caicos Islands', 'Turks Islands', 'Caicos Islands', 'TC', 'TCA'
      currency 'USD'
    end
  end
end
