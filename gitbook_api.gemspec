# -*- encoding: utf-8 -*-
require File.expand_path('../lib/gitbook_api/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Calvin Huang"]
  gem.email         = ["calvin.peak@capslock.tw"]
  gem.description   = %q{Ruby unofficial API for gitbook.com.}
  gem.summary       = %q{Ruby unofficial API for gitbook.com.}
  gem.homepage      = "https://github.com/Calvin-Huang/gitbook-api"
  gem.license       = "MIT"

  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.name          = "gitbook-api"
  gem.require_paths = ["lib"]
  gem.version       = GitBook::VERSION

  gem.add_dependency 'omniauth', '~> 1.0'
  gem.add_dependency 'omniauth-oauth2', '>= 1.1.1', '< 2.0'
  gem.add_dependency 'omniauth-gitbook', '>= 1.0.0', '< 2.0'
  gem.add_dependency 'nokogiri', '~> 1.0'
  gem.add_development_dependency 'rspec', '~> 3.0'
  gem.add_development_dependency 'rack-test'
  gem.add_development_dependency 'simplecov'
  gem.add_development_dependency 'webmock'
end
