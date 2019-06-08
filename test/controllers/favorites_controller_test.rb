require 'test_helper'

class FavoritesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get favorites_index_url
    assert_response :success
  end

  test "should get index_lank_all" do
    get favorites_index_lank_all_url
    assert_response :success
  end

  test "should get lank_pro" do
    get favorites_lank_pro_url
    assert_response :success
  end

  test "should get lank_ama" do
    get favorites_lank_ama_url
    assert_response :success
  end

end
