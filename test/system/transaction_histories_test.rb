require "application_system_test_case"

class TransactionHistoriesTest < ApplicationSystemTestCase
  setup do
    @transaction_history = transaction_histories(:one)
  end

  test "visiting the index" do
    visit transaction_histories_url
    assert_selector "h1", text: "Transaction Histories"
  end

  test "creating a Transaction history" do
    visit transaction_histories_url
    click_on "New Transaction History"

    click_on "Create Transaction history"

    assert_text "Transaction history was successfully created"
    click_on "Back"
  end

  test "updating a Transaction history" do
    visit transaction_histories_url
    click_on "Edit", match: :first

    click_on "Update Transaction history"

    assert_text "Transaction history was successfully updated"
    click_on "Back"
  end

  test "destroying a Transaction history" do
    visit transaction_histories_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Transaction history was successfully destroyed"
  end
end
