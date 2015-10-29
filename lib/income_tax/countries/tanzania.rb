module IncomeTax
  module Countries
    class Tanzania < Models::Progressive
      register "Tanzania", "Tanzania, United Republic of", "TZ", "TZA"
      currency "TZS"

      wants_options :presumptive, :location

      levels :presumptive do # below 20,000,000
        level  4_000_000, "0%"
        level  7_500_000, "3%"
        level 11_500_000, "3.8%"
        level 16_000_000, "4.5%"
        remainder "5.3%"
      end

      levels :mainland do
        level 2_040_000, "0%"
        level 4_320_000, "11%"
        level 6_480_000, "20%"
        level 8_640_000, "25%"
        remainder        "30%"
      end

      levels :zanzibar do
        level 1_800_000, "0%"
        level 4_320_000, "11%"
        level 6_480_000, "20%"
        level 8_640_000, "25%"
        remainder        "30%"
      end

      GROSS_PRESUMPTIVE = 20_000_000
      NET_PRESUMPTIVE   = GROSS_PRESUMPTIVE - levels(:presumptive).calculate_gross(GROSS_PRESUMPTIVE)

      def set_default_options
        options[:presumptive] = true  if options[:presumptive].nil?
        options[:presumptive] = false if gross_income and gross_income > GROSS_PRESUMPTIVE
        options[:presumptive] = false if net_income   and net_income   > NET_PRESUMPTIVE

        case location = options[:location].to_s.downcase
        when 'mainland', 'zanzibar' then options[:location] = location.to_sym
        when ''                     then options[:location] = :mainland
        else raise ArgumentError, 'location needs to be mainland or zanzibar'
        end
      end

      def level_category
        presumptive? ? :presumptive : location
      end
    end
  end
end
