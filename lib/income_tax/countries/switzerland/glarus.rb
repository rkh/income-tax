module IncomeTax
  module Countries
    class Switzerland
      class Glarus < Canton
        register "Glarus", "GL"
        lazy { @tax_years = Marshal.load(File.open("#{__dir__}/data/glarus.dat")) }
        municipal_multiplier "63%"
        cantonal_multiplier  "55%"
      end
    end
  end
end
