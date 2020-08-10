require 'test_helper'

class SendersControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get senders_new_url
    assert_response :success
  end

end
