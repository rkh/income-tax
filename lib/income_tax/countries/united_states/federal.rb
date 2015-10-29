module IncomeTax
  module Countries
    class UnitedStates
      class Federal < Models::Progressive
        wants_options :married, :joint_statement, :head_of_household

        def level_category
          return :single unless married?
          return :joint if joint?
          return :separate unless head_of_household or head_of_household.nil?
          :head_of_household
        end

        GROUPS = [:single, :joint, :separate, :head_of_household]

        MARGINAL_TAX = [
          [ "10%", 9225,   18450,  9225,   13150  ],
          [ "15%", 37450,  74900,  37450,  50200  ],
          [ "25%", 90750,  151200, 75600,  129600 ],
          [ "28%", 189300, 230450, 115225, 209850 ],
          [ "33%", 411500, 411500, 205750, 411500 ],
          [ "35%", 413200, 464850, 232425, 439000 ],
        ]

        REMAINDER          = "39.6%"
        STANDARD_DEDUTIONS = [ 6300, 12600, 6300, 9250 ]

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
