module IncomeTax
  module Countries
    class Macao < Models::Progressive
      register "Macao", "Macau", "MO"
      currency "MOP"

      deduction = Rate("75%") # 25% deduction
      relief    = Rate("70%") # 30% relief

      level 144000, Rate("0%")  * deduction * relief
      level 164000, Rate("7%")  * deduction * relief
      level 184000, Rate("8%")  * deduction * relief
      level 224000, Rate("9%")  * deduction * relief
      level 304000, Rate("10%") * deduction * relief
      level 424000, Rate("11%") * deduction * relief
      remainder     Rate("12%") * deduction * relief
    end
  end
end
