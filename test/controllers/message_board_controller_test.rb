require "test_helper"

class MessageBoardControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get message_board_index_url
    assert_response :success
  end
end
