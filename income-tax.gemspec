require "#{__dir__}/lib/income_tax/version"

Gem::Specification.new 'income-tax', IncomeTax::VERSION do |s|
  s.description = 'Estimate Income Tax for different Countries'
  s.summary     = 'Given a country and a gross or net income, estimate personal income tax.'
  s.author      = 'Konstantin Haase'
  s.email       = 'income-tax-gem@rkh.im'
  s.homepage    = 'https://github.com/rkh/income-tax'
  s.license     = 'MIT'
  s.files       = `git ls-files`.split("\n") - %w(.gitignore .travis.yml)
  s.required_ruby_version = '>= 2.1.0'
end
