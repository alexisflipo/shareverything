require 'test_helper'

class LinksCodeControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get links_code_show_url
    assert_response :success
  end

  test "should get create" do
    get links_code_create_url
    assert_response :success
  end

end
