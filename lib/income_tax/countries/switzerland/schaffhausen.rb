module IncomeTax
  module Countries
    class Switzerland
      class Schaffhausen < Canton
        register "Schaffhausen", "SH"
        lazy { @tax_years = Marshal.load(File.open("#{__dir__}/data/schaffhausen.dat")) }
        municipal_multiplier "98%"
        cantonal_multiplier  "114%"
      end
    end
  end
end
