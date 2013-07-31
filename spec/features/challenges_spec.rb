require 'spec_helper'

describe "challenges" do
# describe "challenges", js: true do
  let!(:challenge) { FactoryGirl.create(:challenge) }
  let!(:user)      { FactoryGirl.create(:user)  }

  context "user not logged in" do
    it "should redirect a non-logged in user to root" do
      visit challenges_path
      current_path.should == root_path
    end
  end

  context "logged in index" do
    before(:each) do
      visit root_path
      fill_in 'user[email]',                  with: user.email
      fill_in 'user[password]',               with: user.password
      click_button('Sign in')
    end

    it "should take a logged in staff user to new challenge path upon link click" do
      user.update_attribute(:staff, true)
      visit challenges_path
      click_link 'Create a New Challenge'
      current_path.should == new_challenge_path
    end

    it "should display a challenge in the database" do
      pending "Database phase?"
      visit challenges_path
      page.should have_content(challenge.name)
    end

    it "should link to show page from first title link" do
      pending "Database phase?"
      visit challenges_path
      click_link challenge.name
      current_path.should == challenge_path(challenge)
    end

  end#end index context

  context "show" do
    before(:each) do
      visit root_path
      fill_in 'user[email]',                  with: user.email
      fill_in 'user[password]',               with: user.password
      click_button('Sign in')
    end
    it "should show title of the post" do
      visit challenge_path(challenge)
      page.should have_content(challenge.name)
    end

    it "should have a working link to edit page for staff" do
      user.update_attribute(:staff, true)
      visit challenge_path(challenge)
      click_link("Edit this Challenge")
      current_path.should == edit_challenge_path(challenge)
    end

    it "should have a working link to the challenge root" do
      visit challenge_path(challenge)
      click_link("Back to Challenges Home")
      current_path.should == challenges_path
    end

    it "should have a comment box" do
      visit challenge_path(challenge)
      page.should have_css('#comment_body')
    end

    it "should show an error on page when a user attemps to post a blank comment", js: true do
      visit challenge_path(challenge)
      click_button "Create Comment"
      page.should have_content("Please enter a comment.")
    end

    it "should show a submitted comment" do
      visit challenge_path(challenge)
      fill_in "comment[body]", with: "I found this link useful: http://memeoverflow.com"
    end
  end

  context "creating a new challenge" do
    before(:each) do
      visit root_path
      fill_in 'user[email]',                  with: user.email
      fill_in 'user[password]',               with: user.password
      click_button('Sign in')
    end

    it "should not have a link to create challenge for student user" do
      visit challenges_path
      page.should_not have_link("Create a New Challenge")
    end

    it "students should NOT reach the new_challenge page" do
      visi\t new_challenge_path
      page.should_not have_content("Create Challenges! You're here now")
    end

    it "staff should reach the new_challenge page" do
      user.update_attribute(:staff, true)
      visit new_challenge_path
      page.should have_content("Create Challenges! You're here now")
    end

    it "should enter data into a forms and be able to submit" do
      user.update_attribute(:staff, true)
      visit new_challenge_path
        fill_in 'Name',           with: "Form Test"
        fill_in 'Actor ID',       with: "1"
        fill_in 'Unit ID',        with: "2"
        fill_in 'Level',          with: "3"
        fill_in 'Default Week',   with: "1"
        fill_in 'Default Day',    with: "1"
        fill_in "Challenge Text", with: "Challenge Text"
        check   'challenge_required'
        click_button 'Save changes'
    end
  end

end