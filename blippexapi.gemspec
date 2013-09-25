require File.dirname(__FILE__) + "/lib/blippexapi/version"

Gem::Specification.new do |s|
  s.name        = 'blippexapi'
  s.version     = BlippexAPI::VERSION
  s.version     = BlippexAPI::VERSION + ".pre.#{ENV['TRAVIS_BUILD_NUMBER']}" if ENV['TRAVIS']
  s.date        = '2013-09-20'
  s.summary     = 'Brandwatch v2 API Wrapper'
  s.description = 'A ruby wrapper for the blippex search engine API made bythe people, forthe people'
  s.author      = 'Jonathan Chrisp'
  s.email       = 'jonathan@brandwatch.com'
  s.license     = 'MIT'
  s.homepage    = 'https://github.com/jonathanchrisp/blippexapi'
  s.required_ruby_version = ">= 1.9.2"

  s.add_development_dependency 'rspec', '~> 2.13.0'

  s.add_runtime_dependency 'faraday', '~> 0.8.7'
  s.add_runtime_dependency 'faraday_middleware', '~> 0.9.0'
  s.add_runtime_dependency 'hashie', '~> 2.0.5'

  s.files         = `git ls-files`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.test_files    = `git ls-files -- spec/*`.split("\n")
  s.require_paths = ['lib']
end