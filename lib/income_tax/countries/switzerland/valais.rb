module IncomeTax
  module Countries
    class Switzerland
      class Valais < Canton
        register "Valais", "Wallis", "VS"
        lazy { @tax_years = Marshal.load(File.open("#{__dir__}/data/valais.dat")) }
      end
    end
  end
end
