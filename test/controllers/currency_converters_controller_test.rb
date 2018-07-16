require 'test_helper'

class CurrencyConvertersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @currency_converter = currency_converters(:one)
  end

  test "should get index" do
    get currency_converters_url
    assert_response :success
  end

  test "should get new" do
    get new_currency_converter_url
    assert_response :success
  end

  test "should create currency_converter" do
    assert_difference('CurrencyConverter.count') do
      post currency_converters_url, params: { currency_converter: {  } }
    end

    assert_redirected_to currency_converter_url(CurrencyConverter.last)
  end

  test "should show currency_converter" do
    get currency_converter_url(@currency_converter)
    assert_response :success
  end

  test "should get edit" do
    get edit_currency_converter_url(@currency_converter)
    assert_response :success
  end

  test "should update currency_converter" do
    patch currency_converter_url(@currency_converter), params: { currency_converter: {  } }
    assert_redirected_to currency_converter_url(@currency_converter)
  end

  test "should destroy currency_converter" do
    assert_difference('CurrencyConverter.count', -1) do
      delete currency_converter_url(@currency_converter)
    end

    assert_redirected_to currency_converters_url
  end
end
