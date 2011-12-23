require 'test_helper'
require 'ostruct'

class Api::PaginationTest < ActionDispatch::IntegrationTest
  class FooController < Api::ApplicationController
    def index
      collection_methods = {
        :current_page => 2,
        :total_pages => 4,
        :next_page => 3,
        :previous_page => 1,
        :to_json => '{"foo": "bar"}'
      }

      collection = OpenStruct.new(collection_methods)
      respond_with(collection)
    end

    def url_for(options)
      "http://example.com/?#{options.to_param}"
    end
  end

  def test_pagination
    index = FooController.action(:index)
    env   = Rack::MockRequest.env_for("/", "HTTP_ACCEPT" => "application/json")
    status, headers, body = index.call(env)
    assert_equal 200, status
    links = ['<http://example.com/?page=1>; rel="first"',
             '<http://example.com/?page=4>; rel="last"',
             '<http://example.com/?page=1>; rel="previous"',
             '<http://example.com/?page=3>; rel="next"']
    assert_equal headers["Link"], links.join(", ")
  end
end

