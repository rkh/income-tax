module IncomeTax
  module Countries
    class Jordan < Models::Progressive
      register 'Jordan', 'JO', 'JOR'
      currency 'JOD'

      # TODO: 12,000 allowance per dependent
      level 12_000, '0%'
      level 22_000, '7%'
      level 32_000, '14%'
      remainder '20%'
    end
  end
end
