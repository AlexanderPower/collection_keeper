FactoryGirl.define do
  factory :collection do
    name { Faker::Lorem.word }
    share false
    factory :invalid_collection do
      name ''
    end
    factory :shared_collection do
      share true
    end
  end
end
