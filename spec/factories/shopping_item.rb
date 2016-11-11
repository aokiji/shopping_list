FactoryGirl.define do
  factory :shopping_item do
    name Faker::Name.name

    trait :description do
      description Faker::Lorem.sentence
    end
  end
end
