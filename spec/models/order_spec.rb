require 'rails_helper'

describe Order do
  before(:each) do
    category = create(:category)    
    @item = create(:item, id: 1, category: category)
    @item_2 = create(:item, id: 2, category: category)
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
    context "instance methods" do 
      it "responds updates stauses" do 
        expect(@order.update_status_paid).to eq true
        expect(@order.update_status_complete).to eq true
        expect(@order_2.update_status_complete).to eq true
        expect(@order_3.update_status_complete).to eq true
      end
      context "cart assignment" do 
        it "finds items and correctly assigns them" do
          cart = {"1" => 2, "2" => 3}
          category = create(:category)
          
          expect(@order.cart_assignment(cart)).to eq 7.5  
        end
      end
    end
  end
end
