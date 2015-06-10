require 'rails_helper'

describe "Authentication" do

  subject { page }

  describe "Login page" do
    before { visit new_user_session_path }
    it { expect have_content('Log in') }
  end

  describe "Login" do
    before { visit new_user_session_path }

    describe "with invalid information" do
      before { click_button "Log in" }
      it { expect have_error_message('Invalid') }
    end

    describe "with valid information" do
      let(:user) { FactoryGirl.create(:user) }
      before do
        fill_in "Email",    with: user.email.upcase
        fill_in "Password", with: user.password
        click_button "Log in"
      end

      it { expect have_link('Log Out',    href: destroy_user_session_path) }
      it { should_not have_link('Log in', href: new_user_session_path) }
    end
  end

  describe "authorization" do

    describe "for non-Loged-in users" do
      let(:user) { FactoryGirl.create(:user) }

      describe "when attempting to visit a protected page" do
        before do
          visit edit_user_registration_path
          fill_in "Email",    with: user.email
          fill_in "Password", with: user.password
          click_button "Log in"
        end

        describe "after Loging in" do

          it "should render the desired protected page" do
            expect(page).to have_content('Edit User')
          end
        end
      end

      describe "in the Users controller" do

        describe "visiting the edit page" do
          before { visit edit_user_registration_path }
          it { should have_content('Log in') }
        end
      end
    end
  end
end