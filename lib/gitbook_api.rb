require 'rake'

require 'gitbook_api/version'
require 'gitbook_api/configurable'
require 'gitbook_api/api'

module GitBook
  class << self
    include GitBook::Configurable

    def api
      # Return a new instance if option in GitBook different to GItBook::API
      return @api if defined?(@api) && @api.same_options?(options)
      @api = GitBook::API.new(options)
    end

    def logger
      # config.logger
    end

    private

    def respond_to_missing?(method_name, include_private=false)
      api.respond_to?(method_name, include_private)
    end

    def method_missing(method_name, *args, &block)
      if api.respond_to?(method_name)
        return api.send(method_name, *args, &block)
      end

      super
    end
  end
end