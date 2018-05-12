require 'rails_helper'

RSpec.feature "Auths", type: :feature do
  feature 'sign up page' do
    scenario "has a new user page" do
      visit new_user_url
      expect(page).to have_content "Sign Up"
    end
  end

  feature "signing up a user" do
    before(:each) do
      sign_up('valvalval@f.com')
    end

    scenario "redirects to sign-in page after signup" do
      expect(page).to have_content "HELLLO!!!"
    end
  end

  feature "with an invalid user" do
    before(:each) do
      sign_up('vpee@g.com', '23')
    end

    scenario "redirects to new user page after failed signup" do
      expect(page).to have_content 'minimum'
    end
  end
end
