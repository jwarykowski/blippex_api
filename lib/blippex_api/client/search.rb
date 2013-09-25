module BlippexAPI
  class Client
    module Search

      # Get search data
      #
      # @param opts [String] q search term
      # @option opts [Integer] w the scoring of the searchterms has on the ranking of the search result in percent
      # @option opts [Integer] d the number of days the search should go back
      # @option opts [Integer] highlight highlight=1 if you want to add an excerpt of the text with a the highlighted search terms
      # @option opts [Integer] limit this is the number of individual objects that are returned (maximum 100)
      # @option opts [Integer] offset this offsets the start of the results by the number specified
      # @option opts [String] callback the response will use the JSONP format with a callback of the given name
      # @return [Hashie::Mash] Hash containing the response
      def search opts={}
        get 'search', opts
      end

    end
  end
end