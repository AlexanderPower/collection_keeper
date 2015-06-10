require 'rails_helper'

describe "Pictures" do
  # Already registered user with collection
  let(:user) { FactoryGirl.create(:user_with_collection) }

  before do
    login_as(user, :scope => :user, :run_callbacks => false)
  end

  describe "Create new picture" do

    before(:each) do
      visit collection_path(user.collections.first)
      click_link 'New picture'
    end

    it 'page have content' do
      expect(page).to have_content 'New picture'
    end

    it 'page have content with new picture text' do
      attach_file 'Image', Rails.root.join("spec", "support", "test_image.jpg")
      click_button 'Create Picture'
      expect(page).to have_css 'img.img-responsive'
    end
  end
end