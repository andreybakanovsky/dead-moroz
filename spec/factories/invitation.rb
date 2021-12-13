FactoryBot.define do
  factory :invitation do
    association :dead_moroz, factory: :user
    email { 'mail@mail.com' }
    status { 4 }
  end
end
