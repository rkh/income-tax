module IncomeTax
  module Countries
    class Togo < Models::FixedRate
      register 'Togo', 'TG', 'TGO'
      currency 'XOF'
      rate     '7%'
    end
  end
end
