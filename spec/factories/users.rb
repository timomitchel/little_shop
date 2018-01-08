FactoryBot.define do
  factory :user do
    sequence(:username) {|n| "username#{n}"}
    sequence(:password) {|n| "description#{n}"}
    sequence(:fullname) {|n| "fullname#{n}"}
    sequence(:address) {|n| "address#{n}"}
  end
end
