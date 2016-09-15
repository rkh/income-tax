module IncomeTax
  module Countries
    class Tuvalu < Models::FixedRate
      register 'Tuvalu', 'TV', 'TUV'
      currency 'TVD'
      rate     '30%'
    end
  end
end
