require 'spec_helper'


describe 'home page' do
  it 'welcomes the user' do
    visit '/'
    page.should have_content('Welcome')
  end

  it "has a link to the homepage" do
    visit '/'
    click_link 'PlayDough'
    current_path.should == root_path
  end
end

describe "log in / log out / sign up" do
let!(:user) { FactoryGirl.create(:user) }

  # denied for devboot's actual user setup
  # it "should allow a user to create an account from users/sign_up" do
  #   visit '/users/sign_up'
  #   within('.main') do
  #     fill_in 'user[email]',                  with: 'test_user@dbc.com'
  #     fill_in 'user[password]',               with: 'password'
  #     fill_in 'user[password_confirmation]',  with: 'password'
  #     click_button 'Sign up'
  #   end
  #   current_path.should == root_path
  #   page.should have_content('Welcome! You have signed up successfully.')
  # end

  it "should allow a signed in user to sign out" do
    visit root_path
    fill_in 'user[email]',                  with: user.email
    fill_in 'user[password]',               with: user.password
    click_button('Sign in')
    current_path.should == root_path
    page.should have_content('Signed in successfully.')
    click_link 'Logout'
    current_path.should == root_path
    page.should have_content('Signed out successfully.')
  end
end