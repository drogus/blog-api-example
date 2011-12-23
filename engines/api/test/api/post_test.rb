require 'test_helper'

class Api::PostTest < ActiveSupport::TestCase
  def test_post_returns_json_representation_standard
    attributes = { :title => "First", :content => "cool" }
    post = Post.create(attributes)
    json_hash = Api::Post.new(post).as_json

    assert_equal attributes.merge(:id => post.id), json_hash
  end

  def test_post_returns_json_represantation_mockist
    attributes = { :id => 1, :title => "First", :content => "cool" }
    post = OpenStruct.new(attributes)
    json_hash = Api::Post.new(post).as_json

    assert_equal attributes, json_hash
  end
end
