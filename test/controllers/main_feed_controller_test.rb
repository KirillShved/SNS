require 'test_helper'

class MainFeedControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get main_feed_index_url
    assert_response :success
  end

end
