FactoryBot.define do
  factory :tweet do
    association :user, factory: :user
    content { Faker::Lorem.paragraph }
  end
end
