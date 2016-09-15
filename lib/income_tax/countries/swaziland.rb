module IncomeTax
  module Countries
    class Swaziland < Models::FixedRate
      register 'Swaziland', 'SZ', 'SWZ'
      currency 'SZL'
      rate '33%'
    end
  end
end
