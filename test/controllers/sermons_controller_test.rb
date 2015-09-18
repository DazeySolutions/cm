require 'test_helper'

class SermonsControllerTest < ActionController::TestCase
  setup do
    @sermon = sermons(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:sermons)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create sermon" do
    assert_difference('Sermon.count') do
      post :create, sermon: { description: @sermon.description, end: @sermon.end, image: @sermon.image, start: @sermon.start, title: @sermon.title, user: @sermon.user }
    end

    assert_redirected_to sermon_path(assigns(:sermon))
  end

  test "should show sermon" do
    get :show, id: @sermon
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @sermon
    assert_response :success
  end

  test "should update sermon" do
    patch :update, id: @sermon, sermon: { description: @sermon.description, end: @sermon.end, image: @sermon.image, start: @sermon.start, title: @sermon.title, user: @sermon.user }
    assert_redirected_to sermon_path(assigns(:sermon))
  end

  test "should destroy sermon" do
    assert_difference('Sermon.count', -1) do
      delete :destroy, id: @sermon
    end

    assert_redirected_to sermons_path
  end
end
