module IncomeTax
  module Countries
    class CostaRica < Models::Progressive
      register "Costa Rica", "CR", "CRI"
      currency "CRC"

      wants_options :self_employed

      factor = 12 * 1000 # units are monthly and in 1000s

      levels :self_employed do
        level factor * 793,   "0%"
        level factor * 1190,  "10%"
        remainder             "15%"
      end

      levels :employee do
        level factor * 3522,  "0%"
        level factor * 5259,  "10%"
        level factor * 8773,  "15%"
        level factor * 17581, "20%"
        remainder "25%"
      end

      def level_category
        self_employed? ? :self_employed : :employee
      end
    end
  end
end
