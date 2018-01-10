require 'rails_helper'

describe Order do
  before(:each) do
    @user = create(:user)
    @order = Order.create(user: @user)
    @order_2 = Order.create(status: 1, user: @user)
    @order_3 = Order.create(status: 2, user: @user)
    @order_4 = Order.create(status: 3, user: @user)
    @order_5 = Order.create(status: 1, user: @user)
    @order_6 = Order.create(status: 2, user: @user)
  end
  context "relationships" do 
    it {should belong_to(:user)}
    it {should have_many(:item_orders)}
    it {should have_many(:items)}
  end
  context "enum" do 
    it {should define_enum_for :status}
    
  end
  context "class methods" do 
    it "responds to all status count methods" do 
      expect(Order.ordered_count).to eq 1
      expect(Order.paid_count).to eq 2
      expect(Order.cancelled_count).to eq 2
      expect(Order.completed_count).to eq 1
    end
  end
end
