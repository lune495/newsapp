require "application_system_test_case"

class FamillesTest < ApplicationSystemTestCase
  setup do
    @famille = familles(:one)
  end

  test "visiting the index" do
    visit familles_url
    assert_selector "h1", text: "Familles"
  end

  test "creating a Famille" do
    visit familles_url
    click_on "New Famille"

    fill_in "Nom", with: @famille.nom
    click_on "Create Famille"

    assert_text "Famille was successfully created"
    click_on "Back"
  end

  test "updating a Famille" do
    visit familles_url
    click_on "Edit", match: :first

    fill_in "Nom", with: @famille.nom
    click_on "Update Famille"

    assert_text "Famille was successfully updated"
    click_on "Back"
  end

  test "destroying a Famille" do
    visit familles_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Famille was successfully destroyed"
  end
end
