FactoryBot.define do
  factory :good do
    association :child, factory: :user
    year { Date.current.year }
    content { "I've made many goods this year" }
  end
end
