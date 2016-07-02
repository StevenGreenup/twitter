require "test_helper"

class SignUpAndSignInUsersTest < Capybara::Rails::TestCase

  test "Sign up and sign in users" do
    skip()
    visit root_path

    click_link "Sign up"
    fill_in "Username", with: "testing"
    fill_in "Photo url", with: "https://pbs.twimg.com/profile_images/727184392859185153/rLNPyViG.jpg"
    fill_in "Password", with: "testing"
    fill_in "Password confirmation", with: "testing"
    click_button "Create User"


  end
end
