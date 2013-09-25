require 'blippex_api/version'
require 'blippex_api/configuration'
require 'blippex_api/client'

# BlippexAPI namespace module
module BlippexAPI
  extend Configuration
  class << self

    # Alias for BlippexAPI::Client.new
    #
    # @return [BlippexAPI::Client]
    def new opts={}
      BlippexAPI::Client.new opts
    end

    # Delegate to BlippexAPI::Client.new
    def method_missing method, *args, &block
      return super unless new.respond_to? method
      new.send method, *args, &block
    end

    # Check if method responds_to?
    def respond_to? method, include_private=false
      new.respond_to?(method, include_private) || super(method, include_private)
    end

  end
end