require 'test_helper'

class EntityResponderTest < ActionController::TestCase
  tests ResourcesController

  def setup
    @id = 1
    @resource = Resource.new(@id)
  end

  def test_get_resource
    get :show, id: @id, :format => :json

    assert_equal 200, response.status
    refute_empty response.body.strip
  end

  def test_post_resource
    post :create, :format => :json

    assert_equal 201, response.status
    refute_empty response.body.strip
  end

  def test_put_resource
    put :update, id: @id, :format => :json

    assert_equal 200, response.status
    refute_empty response.body.strip
  end

  def test_delete_resource
    delete :destroy, id: @id, :format => :json

    assert_equal 200, response.status
    refute_empty response.body.strip
  end
end
