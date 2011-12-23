require 'api/responders/pagination_responder'

module Api
  module Responders
    class AppResponder < ActionController::Responder
      include Api::Responders::PaginationResponder
    end
  end
end
