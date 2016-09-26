require 'test_helper'

class FamilyControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get family_new_url
    assert_response :success
  end

end
