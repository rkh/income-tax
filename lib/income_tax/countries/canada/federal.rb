module IncomeTax
  module Countries
    class Canada
      class Federal < Models::Progressive
        levels year: 2015 do
          level offset(44_700), '15%'
          level offset(44_700), '22%'
          level offset(49_185), '26%'
          remainder '29%'
        end

        levels year: 2016 do
          level offset(45_282), '15%'
          level offset(45_281), '22%'
          level offset(49_825), '26%'
          level offset(59_612), '29%'
          remainder '33%'
        end
      end
    end
  end
end
