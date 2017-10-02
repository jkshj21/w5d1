require 'spec_helper'
require 'rails_helper'

feature 'the signup process' do
  scenario 'has a new user page' do
    visit new_user_url
    expect(page).to have_content 'New User'
  end


  feature 'signing up a user' do

    scenario 'shows username on the homepage after signup' do
      visit new_user_url
      fill_in 'Email', :with => "testing.gmail.com"
      fill_in 'Password', :with => "password"
      click_on 'Sign Up'

      expect(page).to have_content 'testing.gmail.com'
    end
  end
end

feature 'logging in' do
  scenario 'shows username on the homepage after login' do
    visit new_session_url
    fill_in 'Email', :with => "testing.gmail.com"
    fill_in 'Password', :with => "password"
    click_on 'Sign In'

    expect(page).to have_content 'testing.gmail.com'
  end
end

feature 'logging out' do
  scenario 'begins with a logged out state' do
    visit new_user_url
    fill_in 'Email', :with => "testing.gmail.com"
    fill_in 'Password', :with => "password"
    click_on 'Sign Out'

    expect(page).to have_content 'testing.gmail.com'
  end

  scenario 'doesn\'t show username on the homepage after logout' do

  end

end
