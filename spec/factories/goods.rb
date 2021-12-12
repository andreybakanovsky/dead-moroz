FactoryBot.define do
  factory :good do
    association :child, factory: :user
    year { 2021 }
    content { "I've made many goods this year" }
  end
end
