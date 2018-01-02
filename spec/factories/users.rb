FactoryBot.define do
  factory :user do
    sequence(:username) {|n| "username#{n}"}
    sequence(:password) {|n| "description#{n}"}
  end
end
