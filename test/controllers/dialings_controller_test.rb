require 'test_helper'

class DialingsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get dialings_index_url
    assert_response :success
  end

  test "should get show" do
    get dialings_show_url
    assert_response :success
  end

  test "should get create" do
    get dialings_create_url
    assert_response :success
  end

  test "should get update" do
    get dialings_update_url
    assert_response :success
  end

end
