require 'test_helper'

class PagesControllerTest < ActionDispatch::IntegrationTest
  test "should get secret" do
    get pages_secret_url
    assert_response :success
  end

end
