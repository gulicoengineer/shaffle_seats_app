require "test_helper"

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get menu" do
    get root_url
    assert_response :success
  end

  test "should get main" do
    get "/static_pages/main"
    assert_response :success
  end

  test "should get setting" do
    get "/static_pages/setting"
    assert_response :success
  end

  
end
