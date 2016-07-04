module IncomeTax
  module Countries
    class UnitedStates
      class Alabama < State
        register 'Alabama', 'AL'
        deduct_federal

        levels :single do
          level 2_500, '0%'
          level 3_000, '2%'
          level 5_500, '4%'
          remainder    '5%'
        end

        levels :couple do
          level  7_500, '0%'
          level  8_500, '2%'
          level 13_500, '4%'
          remainder     '5%'
        end
      end
    end
  end
end
