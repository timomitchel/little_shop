require 'rails_helper'

describe "User who is an admin logs in and sees admin dashboard" do
  context "an admin logs in" do
    context "they click on admin dashboard" do 
    before(:each) do
      @admin = create(:user, role: 1)
      @user = create(:user, role: 0)
      @user_2 = create(:user, role: 0)
      order_1 = create(:order, status: 0, user_id: @user.id)
      order_2 = create(:order, status: 1, user_id: @user.id)
      order_3 = create(:order, status: 2, user_id: @user.id)
      order_4 = create(:order, status: 3, user_id: @user.id)
      order_5 = create(:order, status: 0, user_id: @user_2.id)
      order_6 = create(:order, status: 2, user_id: @user_2.id)
    end
    it "they see Admin Dashboard" do
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@admin)

        visit admin_dashboard_path

        expect(page).to have_content ("Orders:")
        expect(page).to have_content ("Totals:")
        expect(page).to have_content ("Ordered: 2")
        expect(page).to have_content ("Paid: 1")
        expect(page).to have_content ("Cancelled: 2")
        expect(page).to have_content ("Completed: 1")

        expect(page).to have_link "cancel"
        expect(page).to have_link "mark as paid"
        expect(page).to have_link "mark as completed"
        save_and_open_page
      end
    end
  end
end
      