require 'test_helper'

class GuaranteesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get guarantees_index_url
    assert_response :success
  end

  test "should get new" do
    get guarantees_new_url
    assert_response :success
  end

  test "should get show" do
    get guarantees_show_url
    assert_response :success
  end

  test "should get edit" do
    get guarantees_edit_url
    assert_response :success
  end

end
