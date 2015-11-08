module IncomeTax
  module Countries
    class Switzerland
      class Geneva < Canton
        register "Geneva", "GE"
        lazy { @tax_years = Marshal.load(File.open("#{__dir__}/data/geneva.dat")) }
        municipal_multiplier "45.5%"
        cantonal_multiplier  "148.5%"
      end
    end
  end
end
