require 'rails_helper'

describe "User who is an admin logs in and sees admin dashboard" do
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
  
  context "a default user logs in" do
    it 'does not allow default user to see admin categories index' do
      user = create(:user, role: 0)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit admin_dashboard_path

      expect(page).to_not have_content("Admin Dashboard")
      expect(page).to have_content("The page you were looking for doesn't exist.")
    end
  end
end
