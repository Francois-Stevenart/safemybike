require 'test_helper'

class GaragesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get garages_index_url
    assert_response :success
  end

  test "should get show" do
    get garages_show_url
    assert_response :success
  end

end
