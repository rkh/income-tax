module IncomeTax
  module Countries
    class UnitedStates
      class Hawaii < State
        register "Hawaii", "HI"

        levels :single do
          standard_deduction = 1144
          level standard_deduction + 0,         "0.00%"
          level standard_deduction + 2400,      "1.4%"
          level standard_deduction + 4800,      "3.2%"
          level standard_deduction + 9600,      "5.5%"
          level standard_deduction + 14400,     "6.4%"
          level standard_deduction + 19200,     "6.8%"
          level standard_deduction + 24000,     "7.2%"
          level standard_deduction + 36000,     "7.6%"
          level standard_deduction + 48000,     "7.9%"
          level standard_deduction + 150000,    "8.25%"
          level standard_deduction + 175000,    "9%"
          level standard_deduction + 200000,    "10%"
          remainder                             "11%"
        end

        levels :couple do
          standard_deduction = 1144
          level standard_deduction + 0,         "11%"
          level standard_deduction + 4800,      "1.4%"
          level standard_deduction + 9600,      "3.2%"
          level standard_deduction + 19200,     "5.5%"
          level standard_deduction + 28800,     "6.4%"
          level standard_deduction + 38400,     "6.8%"
          level standard_deduction + 48000,     "7.2%"
          level standard_deduction + 72000,     "7.6%"
          level standard_deduction + 96000,     "7.9%"
          level standard_deduction + 300000,    "8.25%"
          level standard_deduction + 350000,    "9%"
          level standard_deduction + 400000,    "10%"
          remainder                             "11%"
        end
      end
    end
  end
end
