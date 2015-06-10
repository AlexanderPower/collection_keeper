require 'rails_helper'

describe "Links" do
  # Already registered user with collection
  let(:user) { FactoryGirl.create(:user_with_collection) }

  before do
    login_as(user, :scope => :user, :run_callbacks => false)
  end

  describe "Create new link" do

    before(:each) do
      visit collection_path(user.collections.first)
      click_link 'New link'
    end

    it 'page have content' do
      expect(page).to have_content 'New link'
    end

    it 'page have content with new link text' do
      fill_in 'Text', with: 'link1'
      click_button 'Create Link'
      expect(page).to have_content 'link1'
    end
  end
end