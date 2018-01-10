require 'rails_helper'

describe Order do
  context "relationships" do 
    it { should belong_to(:user)}
    it {should have_many(:item_orders)}
    it {should have_many(:items)}
  end
  context "enum" do 
    it {should define_enum_for :status}
    
  end
  context "class methods" do 

  end
end
