module IncomeTax
  module Countries
    class Switzerland
      class StGallen < Canton
        register "St. Gallen", "SG"
        lazy { @tax_years = Marshal.load(File.open("#{__dir__}/data/st_gallen.dat")) }
        municipal_multiplier "144%"
        cantonal_multiplier  "115%"
      end
    end
  end
end
