require 'blippex_api/connection'
require 'blippex_api/request'

require 'blippex_api/client/info'
require 'blippex_api/client/search'
require 'blippex_api/client/rate_limit_status'

module BlippexAPI
  # Client class to create BlippexAPI instances
  class Client

    attr_accessor *Configuration::OPTION_KEYS

    def initialize opts={}
      # Merge opts
      opts = BlippexAPI.options.merge opts

      # Create instance variables
      Configuration::OPTION_KEYS.each do |k|
        send "#{k}=", opts[k]
      end
    end

    include BlippexAPI::Connection
    include BlippexAPI::Request

    # API endpoints
    include BlippexAPI::Client::Info
    include BlippexAPI::Client::Search
    include BlippexAPI::Client::RateLimitStatus

  end
end