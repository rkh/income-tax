module IncomeTax
  module Countries
    class Switzerland
      class Bern < Canton
        register "Bern", "Berne", "BE"
        lazy { @tax_years = Marshal.load(File.open("#{__dir__}/data/bern.dat")) }
      end
    end
  end
end
