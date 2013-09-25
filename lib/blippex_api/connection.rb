require 'faraday_middleware'
require 'faraday/utils/utils'

module BlippexAPI
  # Connection module to handle requests
  module Connection
    private

    # Create a connection to send request
    def connection opts={}
      connection = Faraday.new(opts) do |conn|

        if opts[:force_urlencoded]
          conn.request :url_encoded
        else
          conn.request :json
        end

        conn.request :json
        conn.use FaradayMiddleware::FollowRedirects
        conn.use FaradayMiddleware::Mashify
        conn.use FaradayMiddleware::ParseJson, :content_type => /\bjson$/
        conn.adapter adapter
      end

      connection.headers[:user_agent] = user_agent
      connection
    end

  end
end