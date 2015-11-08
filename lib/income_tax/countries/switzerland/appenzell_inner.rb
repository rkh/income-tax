module IncomeTax
  module Countries
    class Switzerland
      class AppenzellInner < Canton
        register "Appenzell Inner Rhodes", "Appenzell Innerrhoden", "AI"
        lazy { @tax_years = Marshal.load(File.open("#{__dir__}/data/appenzell_inner.dat")) }
        municipal_multiplier "77%"
        cantonal_multiplier  "96%"
      end
    end
  end
end
