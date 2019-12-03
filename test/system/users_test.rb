require "application_system_test_case"

class UsersTest < ApplicationSystemTestCase
  test "Signing up" do
    visit signup_path
    fill_in "Name", with: "autotest"
    fill_in "Email", with: "autotest@test.com"
    fill_in "Password", with: "12345"
    fill_in "Confirm Password", with: "12345"
    
    click_on "Join"
    
    assert_text "Account Created"
    assert_selector "nav", text: "Logout"
    refute_selector "nav", text: "Login"
  end
  
  test "Signing up failure" do
    visit signup_path
    fill_in "Name", with: "autotest"
    fill_in "Password", with: "12345"
    fill_in "Confirm Password", with: "12345"
    
    click_on "Join"
    
    assert_text "please fix the errors below"
    assert_selector "nav", text: "Login"
    refute_selector "nav", text: "Logout"
  end
  
  test "Login with user works" do
    user = FactoryBot.create :user, email: "test@account.com", password: "12345"
    
    visit login_path
    fill_in "Email", with: "test@account.com"
    fill_in "Password", with: "12345"
    
    click_on "Log in"
    
    assert_text "Logged In!"
    assert_selector "nav", text: "Logout"
    refute_selector "nav", text: "Login"
  end
end
