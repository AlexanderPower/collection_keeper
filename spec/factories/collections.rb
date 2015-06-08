FactoryGirl.define do
  factory :collection do
    name { Faker::Lorem.word }
    factory :invalid_collection do
      name ''
    end
  end
end
