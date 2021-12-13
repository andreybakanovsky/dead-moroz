FactoryBot.define do
  factory :review do
    association :good, factory: :good
    association :author, factory: :user
    grade { 8 }
    comment { 'some text ... a perfect kid;)' }
  end
end
