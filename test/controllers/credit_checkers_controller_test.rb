require 'test_helper'

class CreditCheckersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @credit_checker = credit_checkers(:one)
  end

  test "should get index" do
    get credit_checkers_url
    assert_response :success
  end

  test "should get new" do
    get new_credit_checker_url
    assert_response :success
  end

  test "should create credit_checker" do
    assert_difference('CreditChecker.count') do
      post credit_checkers_url, params: { credit_checker: {  } }
    end

    assert_redirected_to credit_checker_url(CreditChecker.last)
  end

  test "should show credit_checker" do
    get credit_checker_url(@credit_checker)
    assert_response :success
  end

  test "should get edit" do
    get edit_credit_checker_url(@credit_checker)
    assert_response :success
  end

  test "should update credit_checker" do
    patch credit_checker_url(@credit_checker), params: { credit_checker: {  } }
    assert_redirected_to credit_checker_url(@credit_checker)
  end

  test "should destroy credit_checker" do
    assert_difference('CreditChecker.count', -1) do
      delete credit_checker_url(@credit_checker)
    end

    assert_redirected_to credit_checkers_url
  end
end
