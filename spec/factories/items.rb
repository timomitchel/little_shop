FactoryBot.define do 
  factory :item do 
    sequence(:title) {|n| "title#{n}"}
    sequence(:description) {|n| "description#{n}"}
    price 1.50
    image "../app/assets/images/latte.jpg"
  end
end