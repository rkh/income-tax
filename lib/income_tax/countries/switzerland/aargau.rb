module IncomeTax
  module Countries
    class Switzerland
      class Aargau < Canton
        register "Aargau", "Argovia", "AG"
        lazy { @tax_years = Marshal.load(File.open("#{__dir__}/data/aargau.dat")) }
        municipal_multiplier "94%"
        cantonal_multiplier  "109%"
      end
    end
  end
end
