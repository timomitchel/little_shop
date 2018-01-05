require 'rails_helper'

describe "Admin logs in and sees admin dashboard" do
  context "an admin logs in" do
    it "they see Admin Dashboard" do
      admin = create(:user, role: 1)

      visit '/'
      click_on "Login"

      expect(current_path).to eq(login_path)

      fill_in "username", with: admin.username
      fill_in "password", with: admin.password
      click_on "Sign In"

      expect(current_path).to eq(admin_dashboard_path)
      expect(page).to have_content("Admin Dashboard")
    end
  end
end
