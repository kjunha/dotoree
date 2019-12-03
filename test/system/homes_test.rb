require "application_system_test_case"

class HomesTest < ApplicationSystemTestCase
  test "visiting the home page" do
    visit root_url
  
    assert_selector "h1", text: "Welcome to Dotoree"
  end
  
  test "visiting the about page" do
    visit about_path
  
    assert_selector "h1", text: "Home#about"
  end
end
