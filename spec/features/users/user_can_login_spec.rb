require 'rails_helper'

describe "Registered user logs in" do
  context "they visit the root page" do
    context "they click login link" do
      context "they enter username and password" do
        it "logs in a user" do
          user = User.create(username: "1244", password: "1234")
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
          expect(page).to have_content("Edit Details")

        end
      end
    end
  end
end
