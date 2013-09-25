module BlippexAPI
  class Client
    module RateLimitStatus

      def rate_limit_status opts={}
        get 'ratelimitstatus', opts
      end

    end
  end
end