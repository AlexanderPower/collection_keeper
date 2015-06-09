FactoryGirl.define do
  factory :link do
    text { Faker::Lorem.word }
    factory :invalid_link do
      text ''
    end
  end
end
