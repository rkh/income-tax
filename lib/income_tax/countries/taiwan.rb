module IncomeTax
  module Countries
    class Taiwan < Models::Progressive
      register 'Taiwan', 'Taiwan, Province of China', 'China, Republic of', 'TW', 'TWN'
      currency 'TWD'

      level 500_000, '5%'
      level 1_130_000, '12%'
      level 2_260_000, '20%'
      level 4_230_000, '30%'
      remainder        '40%'
    end
  end
end
