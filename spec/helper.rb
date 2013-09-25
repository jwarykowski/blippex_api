require 'coveralls'
require 'simplecov'

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter[
  Coveralls::SimpleCov::Formatter,
  SimpleCov::Formatter::HTMLFormatter,
]

SimpleCov.start
require 'blippex_api'

RSpec.configure do |config|
  config.color_enabled  = true
  config.formatter      = :documentation
end

def fixture_path
  File.expand_path("../fixtures", __FILE__)
end