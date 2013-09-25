require 'faraday'

# TODO: Remove this patch once latest faraday rc has been released
# https://github.com/lostisland/faraday/issues/182#issuecomment-19518167
module Faraday
  # Overriding Faraday::Utils module build_nested_query method
  module Utils
    def build_nested_query(value, prefix = nil)
      case value
      when Array
        value.map { |v| build_nested_query(v, "#{prefix}") }.join("&")
        #value.map { |v| build_nested_query(v, "#{prefix}%5B%5D") }.join("&")
      when Hash
        value.map { |k, v|
          build_nested_query(v, prefix ? "#{prefix}#{escape(k)}" : escape(k))
          #build_nested_query(v, prefix ? "#{prefix}%5B#{escape(k)}%5D" : escape(k))
        }.join("&")
      when NilClass
        prefix
      else
        raise ArgumentError, "value must be a Hash" if prefix.nil?
        "#{prefix}=#{escape(value)}"
      end
    end
  end
end