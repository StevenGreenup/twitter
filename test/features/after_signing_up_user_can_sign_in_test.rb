require "test_helper"

class AfterSigningUpUserCanSignInTest < Capybara::Rails::TestCase

  test "Users can sign in after signing up" do
    visit new_user_path
    fill_in "Username", with: "testing"
    fill_in "Photo url", with: "https://pbs.twimg.com/profile_images/727184392859185153/rLNPyViG.jpg"
    fill_in "Password", with: "testing"
    fill_in "Password confirmation", with: "testing"
    click_button "Create User"
    assert_content "testing"
    click_link "Sign Out"
    fill_in "Username", with: "testing"
    fill_in "Password", with: "testing"
    click_button "Sign in"
    assert_content "testing"
  end
end
