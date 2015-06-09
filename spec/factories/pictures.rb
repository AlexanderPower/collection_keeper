FactoryGirl.define do
  factory :picture do
    # image File.new(Rails.root.join("spec", "support", "test_image.jpg"))
    image Rack::Test::UploadedFile.new(Rails.root.join("spec", "support", "test_image.jpg"),'image/jpg')

    # image {fixture_file_upload(Rails.root.join("spec", "support", "test_image.jpg"))}
    # image_name Rails.root.join("spec", "support", "test_image.jpg")
  end
end
