FactoryBot.define do
  factory :good do
    association :user, factory: :user
    year { 2021 }
    content { "I've made many goods this year" }
  end
end
