require 'rspec'
require 'rack/test'
# require 'webmock/rspec'
require 'gitbook_api'

RSpec.configure do |config|
  # config.include WebMock::API
  config.include Rack::Test::Methods
end