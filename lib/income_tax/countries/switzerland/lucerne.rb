module IncomeTax
  module Countries
    class Switzerland
      class Lucerne < Canton
        register "Lucerne", "Luzern", "LU"
        lazy { @tax_years = Marshal.load(File.open("#{__dir__}/data/lucerne.dat")) }
        municipal_multiplier Rational(185,160)
      end
    end
  end
end
