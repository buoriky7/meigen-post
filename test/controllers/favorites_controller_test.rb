require 'test_helper'

class FavoritesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get favorites_index_url
    assert_response :success
  end

  test "should get index_rank_all" do
    get favorites_index_rank_all_url
    assert_response :success
  end

  test "should get rank_pro" do
    get favorites_rank_pro_url
    assert_response :success
  end

  test "should get rank_ama" do
    get favorites_rank_ama_url
    assert_response :success
  end

end
