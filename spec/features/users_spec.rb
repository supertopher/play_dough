require 'spec_helper'



describe "Students" do
  let(:user) { FactoryGirl.create(:user) }
  before(:each) do
    visit root_path
    fill_in 'user[email]',                  with: user.email
    fill_in 'user[password]',               with: user.password
    click_button('Sign in')
  end
  it "should be able to log in without errors" do
    current_path.should == root_path
    page.should have_link("Logout")
  end

  it "should not be able to see staff links" do
    visit root_path
    page.should_not have_link("Create Event")
    page.should_not have_link("Create Phase")
    page.should have_link("Challenges")
  end
end