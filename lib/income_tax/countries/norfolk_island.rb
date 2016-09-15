module IncomeTax
  module Countries
    # Introduction of taxes has been suggested for 2016.
    class NorfolkIsland < Models::NoTaxes
      register 'Norfolk Island', 'NF', 'NFK'
      currency 'AUD'
    end
  end
end
