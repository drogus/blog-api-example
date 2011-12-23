module Api
  module Responders
    module PaginationResponder
      def api_behavior(*args)
        @links = []
        if get? && resource.respond_to?(:current_page)
          add_pagination_link(:first) { 1 }
          add_pagination_link(:last, :total_pages)
          add_pagination_link(:previous, :previous_page)
          add_pagination_link(:next, :next_page)

          if !@links.empty? && controller.headers["Link"].blank?
            controller.headers["Link"] = @links.join(", ")
          end
        end

        super(*args)
      end

      def add_pagination_link(rel, method = nil)
        return if method && !resource.respond_to?(method)
        page = method ? resource.send(method) : yield
        return if page.nil? || page == resource.current_page

        url = controller.url_for(:page => page)
        @links << "<#{url}>; rel=\"#{rel}\""
      end
    end
  end
end
