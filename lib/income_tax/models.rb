module IncomeTax
  module Models
    require 'income_tax/models/generic'
    require 'income_tax/models/not_implemented'
    require 'income_tax/models/progressive'
    require 'income_tax/models/fixed_rate'
    require 'income_tax/models/no_taxes'
    require 'income_tax/models/delegate'
  end
end
