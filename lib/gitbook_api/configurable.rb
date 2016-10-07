module GitBook
  module Configurable
    attr_accessor :base_url, :api_url, :username, :password, :access_token

    def self.keys
      @keys ||= [
          :base_url,
          :api_url,
          :username,
          :password,
          :access_token,
      ]
    end

    def configure
      yield self
    end

    def options
      Hash[GitBook::Configurable.keys.map{ |key| [key, send(key)] }]
    end

    def same_options?(options_to_compare)
      options_to_compare.hash == options.hash
    end

    # Getter will assign default value
    def base_url
      @base_url ||= 'https://www.gitbook.com'
    end

    def api_url
      @api_url ||= 'https://api.gitbook.com'
    end
  end
end