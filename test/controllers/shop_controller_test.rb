require 'test_helper'

class ShopControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get shop_create_url
    assert_response :success
  end

end
