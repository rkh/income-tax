module IncomeTax
  module Countries
    class Bangladesh < Models::Progressive
      register "Bangladesh", "BD", "BGD"
      currency "BDT"

      wants_options :gender, :age, :disabled, :wounded_freedom_fighter

      factor      = 1000
      follow_up   = [ [300, "10%"], [400, "15%"], [500, "20%"], [3000,  "25%"] ]
      rest_amount = "30%"
      thresholds  = {
        male:                    220,
        female:                  275,
        senior:                  275,
        retarded:                350,
        wounded_freedom_fighter: 400
      }

      thresholds.each do |category, threshold|
        levels(category) do
          level threshold * factor, "0%"
          follow_up.each  { |o,r| level offset(o * factor), r }
          remainder rest_amount
        end
      end

      def level_category
        return :wounded_freedom_fighter if wounded_freedom_fighter?
        return :retarded                if disabled?
        return :senior                  if age >= 60

        case gender.to_s
        when "male", "" then :male
        when "female"   then :female
        else
          raise ArgumentError, "Bangladeshi tax law currently only recognizes male and female as genders"
        end
      end
    end
  end
end
