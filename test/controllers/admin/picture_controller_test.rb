require 'test_helper'

class Admin::PictureControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_picture_index_url
    assert_response :success
  end

  test "should get show" do
    get admin_picture_show_url
    assert_response :success
  end

  test "should get new" do
    get admin_picture_new_url
    assert_response :success
  end

  test "should get update" do
    get admin_picture_update_url
    assert_response :success
  end

  test "should get destroy" do
    get admin_picture_destroy_url
    assert_response :success
  end

end
