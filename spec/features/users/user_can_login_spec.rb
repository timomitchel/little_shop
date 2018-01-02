require 'rails_helper'

describe "Registered user logs in" do
  context "they visit the root page" do
    context "they click login link" do
      context "they enter username and password" do
        it "logs in a user" do
          user = create(:user)
          visit "/"

          click_on "Log In"

          expect(current_path).to eq(login_path)

          fill_in "username", with: user.username
          fill_in "password", with: user.password

          click_on "Sign In"

          expect(page).to have_content("Welcome, #{user.name}")
        end
      end
    end
  end
end
