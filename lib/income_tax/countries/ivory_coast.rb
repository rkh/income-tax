module IncomeTax
  module Countries
    class IvoryCoast < Models::Progressive
      register 'Ivory Coast', "Côte d'Ivoire", "Cote d'Ivoire", 'CI', 'CIV'
      currency 'XOF'

      taxed_income = Rate('80%')
      level 600_000, Rate('0%') * taxed_income
      level 1_560_000, Rate('1.5%') * taxed_income
      level 2_400_000, Rate('5%')   * taxed_income
      remainder Rate('10%') * taxed_income
    end
  end
end
