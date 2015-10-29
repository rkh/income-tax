module IncomeTax
  module Countries
    class Switzerland
      class Schwyz < Canton
        register "Schwyz", "SZ"
        lazy { @levels = Marshal.load(File.open("#{__dir__}/data/schwyz.dat")) }
        municipal_multiplier Rational(225, 145)
      end
    end
  end
end
