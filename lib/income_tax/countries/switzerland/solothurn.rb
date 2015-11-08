module IncomeTax
  module Countries
    class Switzerland
      class Solothurn < Canton
        register "Solothurn", "SO"
        lazy { @tax_years = Marshal.load(File.open("#{__dir__}/data/solothurn.dat")) }
        municipal_multiplier "115%"
        cantonal_multiplier  "104%"
      end
    end
  end
end
