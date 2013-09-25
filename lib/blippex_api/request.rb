require 'multi_json'

module BlippexAPI
  # Request module to handle all requests to API
  module Request

    # Perform a get request
    #
    # @param path [String] URL path to send request
    # @param opts [Hash] Request parameters
    # @return [Hashie::Mash] Response body
    def get path, opts={}
      request(:get, path, opts).body
    end

    private

    # Sets connection options
    #
    # @param opts [Hash] hash of opts passed
    # @return [Hash] connection options
    def connection_options opts
      {
        :headers => {
          :user_agent => user_agent
        },
        :force_urlencoded => opts.delete(:force_urlencoded) || false,
        :url => api_endpoint
      }
    end

    # Perform a request
    #
    # @param method [String] Type of request path
    # @param path [String] URL path to send request
    # @param opts [Hash] Request parameters
    # @return [Hashie::Mash] Response
    def request method, path, opts={}
      conn_options = connection_options opts
      response = connection(conn_options).send(method) do |request|
        case method
        when :get
          request.url path, opts
        end
      end

      response
    end
  end
end