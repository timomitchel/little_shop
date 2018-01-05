require 'rails_helper'

describe "User logs in and cannot see admin dashboard" do
  context "a user logs in" do
    it "they can not access Admin Dashboard" do
      user = create(:user, role: 0)

      visit '/'
      click_on "Login"

      expect(current_path).to eq(login_path)

      fill_in "username", with: user.username
      fill_in "password", with: user.password
      click_on "Sign In"

      expect(current_path).to eq(dashboard_path)

      visit '/admin/dashboard'
      expect(page).to_not have_content("Admin Dashboard")
      expect(page).to have_content("404")
    end
  end
end
