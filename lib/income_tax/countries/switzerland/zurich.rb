module IncomeTax
  module Countries
    class Switzerland
      class Zurich < Canton
        register "Zurich", "Zürich", "ZH"
        lazy { @tax_years = Marshal.load(File.open("#{__dir__}/data/zurich.dat")) }

        municipal_multiplier "119%"
      end
    end
  end
end
