module IncomeTax
  module Countries
    class Switzerland
      class BaselLand < Canton
        register "Basel-Landschaft", "Baselland", "Baselbiet", "Basel-Country", "BL"
        lazy { @levels = Marshal.load(File.open("#{__dir__}/data/basel_land.dat")) }
        municipal_multiplier "65%"
      end
    end
  end
end
