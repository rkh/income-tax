module IncomeTax
  module Countries
    class FaroeIslands < Models::FixedRate
      register 'Faroe Islands', 'FO', 'FRO'
      currency 'DKK'
      rate '41.5%' # Government tax plus Municipal tax
    end
  end
end
