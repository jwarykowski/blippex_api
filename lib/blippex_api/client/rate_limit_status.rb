module BlippexAPI
  class Client
    module RateLimitStatus

      # Get request limit status
      #
      # @option opts [String] callback the response will use the JSONP format with a callback of the given name
      # @return [Hashie::Mash] Hash containing the response
      def rate_limit_status opts={}
        get 'ratelimitstatus', opts
      end

    end
  end
end