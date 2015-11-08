module IncomeTax
  module Countries
    class Switzerland
      class AppenzellOuter < Canton
        register "Appenzell Outer Rhodes", "Appenzell Ausserrhoden", "AR"
        lazy { @tax_years = Marshal.load(File.open("#{__dir__}/data/appenzell_outer.dat")) }
        municipal_multiplier Rational(41, 32)
      end
    end
  end
end
