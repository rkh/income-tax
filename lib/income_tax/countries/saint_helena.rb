module IncomeTax
  module Countries
    class SaintHelena < Models::FixedRate
      register 'Saint Helena', 'SH', 'SHN'
      currency 'SHP'
      rate     '25%'
    end
  end
end
