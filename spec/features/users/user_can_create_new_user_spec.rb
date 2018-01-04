require 'rails_helper'

describe "User can sign up as a new user" do
  context "user clicks link for Login" do
    context "user clicks link to Create Account" do
      it "creates a new user" do

        visit new_user_path

        fill_in "user[username]", with: "JavaJoe"
        fill_in "user[password]", with: "joe123"
        click_button "Create Account"

        expect(current_path).to eq(dashboard_path)
        expect(page).to have_content("Logged in as #{User.last.username}!")
        expect(page).to_not have_content("Login")
        expect(page).to have_content("Log Out")
      end
    end
  end
end
