module IncomeTax
  module Countries
    class CentralAfricanRepublic < Models::Progressive
      register 'Central African Republic', 'CF', 'CAF'
      currency 'XAF'

      5.times { |i| level 6_000_000 * (i + 1), "#{i * 10}%" }
      remainder '50%'
    end
  end
end
