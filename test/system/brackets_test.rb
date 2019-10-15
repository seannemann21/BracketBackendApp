require "application_system_test_case"

class BracketsTest < ApplicationSystemTestCase
  setup do
    @bracket = brackets(:one)
  end

  test "visiting the index" do
    visit brackets_url
    assert_selector "h1", text: "Brackets"
  end

  test "creating a Bracket" do
    visit brackets_url
    click_on "New Bracket"

    click_on "Create Bracket"

    assert_text "Bracket was successfully created"
    click_on "Back"
  end

  test "updating a Bracket" do
    visit brackets_url
    click_on "Edit", match: :first

    click_on "Update Bracket"

    assert_text "Bracket was successfully updated"
    click_on "Back"
  end

  test "destroying a Bracket" do
    visit brackets_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Bracket was successfully destroyed"
  end
end
