require 'rails_helper'

describe "As a Admin User" do
  context "I can go to my admin dashboard" do
    before :each do
      @admin = create(:user, role: 1)
      @user_1 = User.create(username: "TYJ", password: "123", fullname: "Timothy", address: "2030 Larimer Street")

      visit '/'
      click_on "Login"

      expect(current_path).to eq(login_path)

      fill_in "username", with: @admin.username
      fill_in "password", with: @admin.password
      click_on "Sign In"

      expect(current_path).to eq(admin_dashboard_path)

    end

    it "should display an option to edit my account details" do
        expect(page).to have_content("Admin Dashboard")

        expect(page).to have_content("#{@admin.username}")
        expect(page).to have_content("Address: #{@admin.address}")
        expect(page).to have_content("Full Name: #{@admin.fullname}")

        expect(page).to have_content("Edit Account Details")

        click_link("Edit Account Details")

        expect(current_path).to eq(edit_admin_user_path(@admin))

        fill_in"user[username]", with: "AdminUser"
        fill_in"user[password]", with: "admin"
        fill_in"user[fullname]", with: "Timothy Joo"
        fill_in"user[address]", with: "2040 Larimer Street"

        click_on "Submit"

        expect(current_path).to eq(admin_dashboard_path)

        expect(page).to have_content("AdminUser")
        expect(page).to have_content("Timothy Joo")
        expect(page).to have_content("2040 Larimer Street")
    end

    it "should render a 404 if i try to access another users account dashboard or try to modify their details" do

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@admin)

      visit admin_dashboard_path

      expect(page).to have_content("Admin Dashboard")


      visit user_path(@user_1)
      # save_and_open_page
      expect(page).to have_content("The page you were looking for doesn't exist.")
    end
  end
end
