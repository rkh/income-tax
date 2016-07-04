module IncomeTax
  module Countries
    class Mongolia < Models::FixedRate
      register 'Mongolia', 'MN', 'MNG'
      currency 'MNT'
      rate     '10%'
    end
  end
end
