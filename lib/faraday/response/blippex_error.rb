require 'faraday'
require 'multi_json'

module Faraday
  # Response::BlippexAPI class to raise custom faraday middleware errors
  class Response::BlippexAPI < Response::Middleware
    ERROR_MAP = {
      400 => BlippexAPI::BadRequest,
      401 => BlippexAPI::Unauthorized,
      403 => BlippexAPI::Forbidden,
      404 => BlippexAPI::NotFound,
      406 => BlippexAPI::NotAcceptable,
      422 => BlippexAPI::UnprocessableEntity,
      429 => BlippexAPI::TooManyRequests,
      500 => BlippexAPI::InternalServerError,
      501 => BlippexAPI::NotImplemented,
      502 => BlippexAPI::BadGateway,
      503 => BlippexAPI::ServiceUnavailable
    }

    def on_complete(response)
      key = response[:status].to_i
      raise ERROR_MAP[key].new(response) if ERROR_MAP.has_key? key
    end
  end
end