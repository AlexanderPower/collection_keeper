FactoryGirl.define do
  factory :user do
    email { Faker::Internet.email }
    password { Faker::Internet.password 3 }
    factory :user_with_collection do
      after(:create) do |user|
        FactoryGirl.create :collection, user: user
      end
    end
  end
end
