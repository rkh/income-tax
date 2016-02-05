module IncomeTax
  module Countries
    class Canada
      class Federal < Models::Progressive
        levels year: 2015 do
          level offset(44700), "15%"
          level offset(44700), "22%"
          level offset(49185), "26%"
          remainder            "29%"
        end

        levels year: 2016 do
          level offset(45282), "15%"
          level offset(45281), "22%"
          level offset(49825), "26%"
          level offset(59612), "29%"
          remainder            "33%"
        end
      end
    end
  end
end
