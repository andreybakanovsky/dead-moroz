FactoryBot.define do
  factory :gift do
    deads_choice { 'false' }

    trait :kid_requested do
      name { 'a puppy' }
      description { 'funny and gentle' }
      deads_choice { 'false' }
      association :giftable, factory: :good
    end

    trait :elf_suggested do
      name { 'a dog' }
      description { 'the puppy, without a name and with a photo' }
      association :giftable, factory: :review
    end
  end
end
