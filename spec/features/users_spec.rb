require 'spec_helper'

describe "Students" do
# describe "Students", js: true do
  let!(:user)      { FactoryGirl.create(:user) }
  let!(:challenge) { FactoryGirl.create(:challenge)}

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
    page.should     have_link("Challenges")
  end

  it "should not throw errors if user has no cohort (staff/lost students)" do
    user.cohort = nil
    visit root_path
  end

  it "should inform user without cohort they will have a callender once their phases starts" do
    user.cohort = nil
    visit root_path
    page.has_content?('When you are assigned a cohort your callender will be here.')
  end

  it "should show a students daily challenges" do
    pending
    visit challenges_path

  end
end

### This is for admin users

describe 'Admin User' do
  let!(:admin) { FactoryGirl.create(:admin) } 
  context "admin logged in" do
    before(:each) do
      visit root_path
      fill_in 'user[email]',                  with: admin.email
      fill_in 'user[password]',               with: admin.password
      click_button('Sign in')
    end

    it "Shows a logged in staff member the create an event page" do
      page.should have_link('Create Event')
    end
  end
end