module IncomeTax
  module Countries
    class UnitedStates
      class Federal < Models::Progressive
        wants_options :married, :joint_statement, :head_of_household

        def level_category
          return :single unless married?
          return :joint if joint_statement?
          return :separate unless head_of_household || head_of_household.nil?
          :head_of_household
        end

        GROUPS = [:single, :joint, :separate, :head_of_household].freeze

        MARGINAL_TAX = [
          ['10%', 9225, 18_450, 9225, 13_150],
          ['15%', 37_450,  74_900,  37_450,  50_200],
          ['25%', 90_750,  151_200, 75_600,  129_600],
          ['28%', 189_300, 230_450, 115_225, 209_850],
          ['33%', 411_500, 411_500, 205_750, 411_500],
          ['35%', 413_200, 464_850, 232_425, 439_000]
        ].freeze

        REMAINDER          = '39.6%'.freeze
        STANDARD_DEDUTIONS = [6300, 12_600, 6300, 9250].freeze

        GROUPS.each_with_index do |group, index|
          levels group do
            MARGINAL_TAX.each do |rate, *boundries|
              boundry = boundries[index] + STANDARD_DEDUTIONS[index]
              level boundry, rate
            end
            remainder REMAINDER
          end
        end
      end
    end
  end
end
