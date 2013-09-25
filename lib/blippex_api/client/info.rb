module BlippexAPI
  class Client
    module Info

      # Get search engine stats
      #
      # @return [Hashie::Mash] Hash containing the results
      def info
        get 'info'
      end

    end
  end
end