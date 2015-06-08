FactoryGirl.define do
  factory :collection do
    name { Faker::Lorem.word }
  end

  factory :invalid_collection do
    name ''
  end

end
