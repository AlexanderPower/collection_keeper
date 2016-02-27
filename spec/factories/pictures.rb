FactoryGirl.define do
  factory :picture do
    image Rack::Test::UploadedFile.new(Rails.root.join("spec", "support", "test_image.jpg"),'image/jpg')
  end
end
