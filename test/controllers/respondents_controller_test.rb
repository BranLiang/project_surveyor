require 'test_helper'

class RespondentsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get respondents_new_url
    assert_response :success
  end

end
