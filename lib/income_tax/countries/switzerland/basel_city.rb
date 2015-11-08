module IncomeTax
  module Countries
    class Switzerland
      class BaselCity < Canton
        register "Basel-Stadt", "Basel-City", "Basel", "BS"
        lazy { @tax_years = Marshal.load(File.open("#{__dir__}/data/basel_city.dat")) }
        municipal_multiplier "0%"
      end
    end
  end
end
