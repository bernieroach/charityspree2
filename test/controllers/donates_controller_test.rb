require 'test_helper'

class DonatesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get donates_new_url
    assert_response :success
  end

  test "should get create" do
    get donates_create_url
    assert_response :success
  end

end
