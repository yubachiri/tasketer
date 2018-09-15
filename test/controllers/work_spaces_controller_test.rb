require 'test_helper'

class WorkSpacesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get work_spaces_index_url
    assert_response :success
  end

  test "should get show" do
    get work_spaces_show_url
    assert_response :success
  end

  test "should get new" do
    get work_spaces_new_url
    assert_response :success
  end

end
