require "application_system_test_case"

class CreditCheckersTest < ApplicationSystemTestCase
  setup do
    @credit_checker = credit_checkers(:one)
  end

  test "visiting the index" do
    visit credit_checkers_url
    assert_selector "h1", text: "Credit Checkers"
  end

  test "creating a Credit checker" do
    visit credit_checkers_url
    click_on "New Credit Checker"

    click_on "Create Credit checker"

    assert_text "Credit checker was successfully created"
    click_on "Back"
  end

  test "updating a Credit checker" do
    visit credit_checkers_url
    click_on "Edit", match: :first

    click_on "Update Credit checker"

    assert_text "Credit checker was successfully updated"
    click_on "Back"
  end

  test "destroying a Credit checker" do
    visit credit_checkers_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Credit checker was successfully destroyed"
  end
end
