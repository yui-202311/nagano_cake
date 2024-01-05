require "test_helper"

class Public::CustomersControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get public_customers_show_url
    assert_response :success
  end

  test "should get edit" do
    get public_customers_edit_url
    assert_response :success
  end

  test "should get update" do
    get public_customers_update_url
    assert_response :success
  end

  test "should get with_drawal" do
    get public_customers_with_drawal_url
    assert_response :success
  end

  test "should get unsubscribe" do
    get public_customers_unsubscribe_url
    assert_response :success
  end
end
