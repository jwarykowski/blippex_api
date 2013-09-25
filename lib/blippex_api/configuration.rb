require 'faraday'

module BlippexAPI
  # Configuration module to set default and custom client credentials
  module Configuration

    OPTION_KEYS = [
      'adapter',
      'api_endpoint',
      'user_agent'
    ].freeze

    DEFAULT_ADAPTER       = Faraday.default_adapter
    DEFAULT_API_ENDPOINT  = 'https://api.blippex.org/'
    DEFAULT_USER_AGENT    = "BlippexAPI Ruby Gem #{BlippexAPI::VERSION}".freeze

    attr_accessor *OPTION_KEYS

    # Extend hook
    def self.extended(base)
      base.reset
    end

    # Set configuration options using a block
    def configure
      yield self
    end

    # Convert option_keys to hash and return
    def options
      OPTION_KEYS.inject({}){|o,k|o.merge!(k => send(k))}
    end

    # Reset the configuration options
    def reset
      self.adapter      = DEFAULT_ADAPTER
      self.user_agent   = DEFAULT_USER_AGENT
      self.api_endpoint = DEFAULT_API_ENDPOINT
    end
  end
end