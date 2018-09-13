require 'test_helper'

class ArchivedTasksControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get archived_tasks_index_url
    assert_response :success
  end

end
