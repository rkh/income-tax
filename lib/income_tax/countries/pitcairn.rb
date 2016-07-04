module IncomeTax
  module Countries
    # There is no taxation on Pitcairn, instead all able-bodied men
    # and women undertake civil obligations when needed, generally
    # consisting of manning the longboats to retrieve any arriving
    # cargo and passengers from the supply ship.
    class Pitcairn < Models::NoTaxes
      register 'Pitcairn', 'PN', 'PCN'
      currency 'NZD'
    end
  end
end
