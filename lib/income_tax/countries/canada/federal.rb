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
          level offset(44700), "15%"
          level offset(44700), "22%"
          level offset(49185), "26%"
          remainder            "29%"
        end
      end
    end
  end
end
