require "application_system_test_case"

class SquaresTest < ApplicationSystemTestCase
  test "index pages shows all squares" do
    user = login_user
    
    square1 = FactoryBot.create :square, user: user
    square2 = FactoryBot.create :square, user: user
    
    visit squares_path
    
    assert_text square1.name
    assert_text square2.name
  end
  
  test "show details of square" do
    user = login_user
    square1 = FactoryBot.create :square, user: user
    visit squares_path
    click_on "show"
    assert_text "Name: " + square1.name
    assert_text "Detail: " + square1.detail
  end
  
  test "create new square" do
    user = login_user
    visit squares_path
    click_button "New Square"
    
    fill_in "Name", with: "Test case"
    fill_in "Detail", with: "test test test"
    click_button "Create"
    
    assert_text "New Square Created!"
    assert_text "Name: Test case"
  end
  
  test "edit square" do
    user = login_user
    square1 = FactoryBot.create :square, user: user
    visit squares_path
    
    click_on "edit"
    fill_in "Name", with: "Edit case"
    fill_in "Detail", with: "edit edit edit"
    click_button "Update"
    
    assert_text "Square Information Updated!"
    assert_text "Name: Edit case"
  end
end
