FactoryBot.define do
  factory :user do |f|
    role { 0 }
    name { 'Henry' }
    age { 7 }
    f.sequence(:email) { |n| "test#{n}@mail.com" }
    password { '123456' }
    password_confirmation { '123456' }
  end
end
