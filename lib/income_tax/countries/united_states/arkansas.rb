module IncomeTax
  module Countries
    class UnitedStates
      class Arkansas < State
        register 'Arkansas', 'AR'

        levels :single do
          level 2000,  '0%'
          level 6199,  '1%'
          level 10_299, '2.5%'
          level 14_399, '3.5%'
          level 22_699, '4.5%'
          level 36_599, '6%'
          remainder    '7%'
        end

        levels :couple do
          level 4000,  '0%'
          level 8199,  '1%'
          level 12_299, '2.5%'
          level 16_399, '3.5%'
          level 24_699, '4.5%'
          level 38_599, '6%'
          remainder '7%'
        end
      end
    end
  end
end
