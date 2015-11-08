module IncomeTax
  module Countries
    class Switzerland
      class Zug < Canton
        register "Zug", "ZG"
        lazy { @tax_years = Marshal.load(File.open("#{__dir__}/data/zug.dat")) }
        municipal_multiplier "60%"
        cantonal_multiplier  "82%"
      end
    end
  end
end
