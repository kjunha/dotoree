require 'test_helper'

class SquaresControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get squares_index_url
    assert_response :success
  end

end
