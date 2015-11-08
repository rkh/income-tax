module IncomeTax
  module Countries
    class Switzerland
      class Nidwalden < Canton
        register "Nidwalden", "NW"
        lazy { @tax_years = Marshal.load(File.open("#{__dir__}/data/nidwalden.dat")) }
        municipal_multiplier Rational(245, 266)
      end
    end
  end
end
