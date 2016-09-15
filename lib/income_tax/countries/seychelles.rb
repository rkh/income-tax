module IncomeTax
  module Countries
    class Seychelles < Models::FixedRate
      register 'Seychelles', 'SC', 'SYC'
      currency 'SCR'
      rate     '15%'
    end
  end
end
