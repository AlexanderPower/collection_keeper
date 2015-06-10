require 'rails_helper'

describe "Collections" do
  # Already registered user
  let(:user) { FactoryGirl.create(:user) }

  let(:user_with_collection) { FactoryGirl.create(:user_with_collection) }

  describe "Create new collection" do

    before(:each) do
      login_as(user, :scope => :user, :run_callbacks => false)
      visit root_path
      click_link 'New'
    end

    it 'page have content' do
      expect(page).to have_content 'New Collection'
    end

    it 'page have content with new collection name' do
      fill_in 'Name', with: 'Col1'
      click_button 'Create Collection'
      expect(page).to have_content 'Col1'
    end

    it 'guest user can not see collection' do
      visit collection_path(user_with_collection.collections.first)
      expect(page).to_not have_content user_with_collection.collections.first.name
    end
  end

  describe 'Share collection' do
    before(:each) do
      login_as(user_with_collection, :scope => :user, :run_callbacks => false)
      visit collection_path(user_with_collection.collections.first)
      click_link 'Share'
    end

    it 'page have right content' do
      expect(page).to have_content collection_url(user_with_collection.collections.first)
      expect(page).to have_content 'Unshare'
    end

    it 'guest user can see collection' do
      visit collection_path(user_with_collection.collections.first)
      expect(page).to have_content user_with_collection.collections.first.name
    end
  end
end

