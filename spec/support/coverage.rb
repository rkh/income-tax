if ENV["SKIP_COVERAGE"].to_i == 0
  require 'simplecov'
  require 'coveralls'

  SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter[
    SimpleCov::Formatter::HTMLFormatter,
    Coveralls::SimpleCov::Formatter
  ]

  SimpleCov.start do
    project_name 'income-tax'
    minimum_coverage 99
    coverage_dir '.coverage'
    add_filter '/spec/'
  end
end
