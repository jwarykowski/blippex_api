module BlippexAPI
  class Client
    module Search

      def search opts={}
        get 'search', opts
      end

    end
  end
end