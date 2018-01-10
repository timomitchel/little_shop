require 'rails_helper'

describe "As a user" do
  context "when i log in i should have the ability to click edit account details" do
    it "will display a new page that has a form field that will allow me to edit my account details" do
      user = User.create(username: "1244", password: "1234", fullname: "James Joseph", address: "2131 Lawrence Street", state: "Arizona")
      visit "/"

      click_on "Login"

      expect(current_path).to eq(login_path)

      fill_in "username", with: user.username
      fill_in "password", with: user.password

      click_on "Sign In"

      expect(current_path).to eq(dashboard_path)
      expect(page).to have_content("Logged in as #{user.username}")
      expect(page).to_not have_content("Log In")
      expect(page).to have_content("Log Out")

      expect(page).to have_content("#{user.address}")
      expect(page).to have_content("#{user.state}")
      expect(page).to have_content("Edit Account Details")

      click_link("Edit Account Details")

      expect(current_path).to eq(edit_user_path(user))

      fill_in "user[username]", with: "tyjoo"
      fill_in "user[password]", with: "12345"
      fill_in "user[fullname]", with: "Joseph Java"
      fill_in "user[address]", with: "2138 Larimer Street"
      fill_in "user[state]", with: "California"

      click_on("Update User")

      expect(current_path).to eq(dashboard_path)
    end
  end
end
