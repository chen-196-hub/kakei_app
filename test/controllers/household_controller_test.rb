require 'test_helper'

class HouseholdControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get household_index_url
    assert_response :success
  end
end
