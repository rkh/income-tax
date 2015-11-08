module IncomeTax
  module Countries
    class Switzerland
      class Fribourg < Canton
        register "Fribourg", "Freiburg", "FR"
        lazy { @tax_years = Marshal.load(File.open("#{__dir__}/data/fribourg.dat")) }
        municipal_multiplier "81.6%"
      end
    end
  end
end
