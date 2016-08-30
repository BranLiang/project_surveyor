require 'test_helper'

class NumRangesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get num_ranges_new_url
    assert_response :success
  end

end
