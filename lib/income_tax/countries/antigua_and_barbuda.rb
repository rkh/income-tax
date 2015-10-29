module IncomeTax
  module Countries
    class AntiguaAndBarbuda < Models::Progressive
      register "Antigua and Barbuda", "Antigua", "Barbuda", "AG", "ATG"
      currency "XCD"

      level 180000, "10%"
      remainder     "18%"
    end
  end
end
