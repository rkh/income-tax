module IncomeTax
  module Countries
    class Switzerland
      class Neuchatel < Canton
        register "Neuchâtel", "Neuchatel", "NE"
        lazy { @tax_years = Marshal.load(File.open("#{__dir__}/data/neuchatel.dat")) }
        municipal_multiplier "67%"
        cantonal_multiplier  "123%"
      end
    end
  end
end
