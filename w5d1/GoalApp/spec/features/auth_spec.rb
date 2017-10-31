require "spec_helper"
require "rails_helper"

feature 'the signup process' do

  scenario 'has a new user page' do
    visit new_user_url
    expect(page).to have_content('Sign Up')
  end

  feature 'signing up a user' do

    scenario 'shows username on the homepage after signup' do
      visit new_user_url
      fill_in('Username', with: 'user')
      fill_in('Password', with: 'password')
      click_on('Sign Up')
      expect(page).to have_content('user')
    end

  end
end

feature 'logging in' do
  scenario 'shows username on the homepage after login' do
    FactoryBot.create(:user)
    visit new_session_url
    fill_in('Username', with: 'user')
    fill_in('Password', with: 'password')
    click_on('Sign In')
    expect(page).to have_content('user')
  end
end

feature 'logging out' do
  scenario 'begins with a logged out state' do
    FactoryBot.create(:user)
    visit new_session_url
    expect(page).not_to have_content('user')
    fill_in('Username', with: 'user')
    fill_in('Password', with: 'password')
    click_on('Sign In')
    expect(page).to have_content('user')
    click_on('Sign Out')
    expect(page.current_path).to eq(new_session_path)
  end

  scenario 'doesn\'t show username on the homepage after logout' do
    FactoryBot.create(:user)
    visit new_session_url
    fill_in('Username', with: 'user')
    fill_in('Password', with: 'password')
    click_on('Sign In')
    expect(page).to have_content('user')
    click_on('Sign Out')
    expect(page.current_path).to eq(new_session_path)
    expect(page.current_path).not_to have_content('user')
  end

end
