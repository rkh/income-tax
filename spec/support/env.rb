require 'bundler/setup'
require 'tool/warning_filter'
$-w = true

require 'rspec'
require 'rspec/its'

RSpec.configure do |config|
  config.expect_with :rspec do |c|
    c.syntax = [:should, :expect]
  end
end
