module IncomeTax
  module Countries
    class CaymanIslands < Models::NoTaxes
      register 'Cayman Islands', 'KY', 'CYM'
      currency 'KYD'
    end
  end
end
