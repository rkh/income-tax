module IncomeTax
  module Countries
    class Switzerland
      class Obwalden < Canton
        register "Obwalden", "OW"
        lazy { @tax_years = Marshal.load(File.open("#{__dir__}/data/obwalden.dat")) }
        municipal_multiplier Rational(416, 305)
      end
    end
  end
end
