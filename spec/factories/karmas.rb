FactoryBot.define do
  factory :karma do
    association :elf, factory: :user
    value { 15 }
  end
end
