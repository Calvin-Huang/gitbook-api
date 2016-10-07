require 'gitbook_api/configurable'
require 'gitbook_api/api/stars'

module GitBook
  class API
    include GitBook::Configurable
    include GitBook::API::Stars

    def initialize(options = {})
      GitBook::Configurable.keys.each do |key|
        instance_variable_set(:"@#{key}", options[key] || GitBook.options.instance_variable_get(:"@#{key}"))
      end
    end
  end
end