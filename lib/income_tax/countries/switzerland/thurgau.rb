module IncomeTax
  module Countries
    class Switzerland
      class Thurgau < Canton
        register "Thurgau", "TG"
        lazy { @tax_years = Marshal.load(File.open("#{__dir__}/data/thurgau.dat")) }
        municipal_multiplier "146%"
        cantonal_multiplier  "117%"
      end
    end
  end
end
