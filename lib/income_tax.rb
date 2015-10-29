module IncomeTax
  require 'income_tax/register'
  CountryRegister = Register.new('country')

  require 'income_tax/helpers'
  extend Helpers
  singleton_class.send(:public, :Rate)

  require 'income_tax/rate'
  require 'income_tax/models'
  require 'income_tax/countries'
  require 'income_tax/factory'

  def self.new(*args)
    Factory.generate(*args)
  end
end
