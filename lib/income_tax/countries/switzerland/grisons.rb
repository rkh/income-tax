module IncomeTax
  module Countries
    class Switzerland
      class Grisons < Canton
        register "Grisons", "Graubünden", "Grigioni", "Grischun", "GR"
        lazy { @tax_years = Marshal.load(File.open("#{__dir__}/data/grisons.dat")) }
        municipal_multiplier "90%"
      end
    end
  end
end
