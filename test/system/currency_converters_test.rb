require "application_system_test_case"

class CurrencyConvertersTest < ApplicationSystemTestCase
  setup do
    @currency_converter = currency_converters(:one)
  end

  test "visiting the index" do
    visit currency_converters_url
    assert_selector "h1", text: "Currency Converters"
  end

  test "creating a Currency converter" do
    visit currency_converters_url
    click_on "New Currency Converter"

    click_on "Create Currency converter"

    assert_text "Currency converter was successfully created"
    click_on "Back"
  end

  test "updating a Currency converter" do
    visit currency_converters_url
    click_on "Edit", match: :first

    click_on "Update Currency converter"

    assert_text "Currency converter was successfully updated"
    click_on "Back"
  end

  test "destroying a Currency converter" do
    visit currency_converters_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Currency converter was successfully destroyed"
  end
end
