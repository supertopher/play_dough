require 'spec_helper'

10.times { FactoryGirl.create(:user) }
10.times { FactoryGirl.create(:challenge) }

describe "challenges" do
  let(:challenge) { FactoryGirl.create(:challenge) }
  let(:user)      { FactoryGirl.create(:user)  }
  let(:first)     { Challenge.first }
  let(:last)      { Challenge.last  }

  context "index" do
    it "should be challenges_path" do
      visit '/challenges'
      current_path.should == challenges_path
    end

    it "should take a user to new challenge path upon link click" do
      visit challenges_path
      click_link 'Create a new Challenge'
      current_path.should == new_challenge_path
    end

    it "should display the last challenge in the database" do
      visit challenges_path
      page.should have_content(last.name)
    end

    it "should link to show page from first title link" do
      visit challenges_path
      click_link last.name
      current_path.should == challenge_path(last)
    end

  end#end index context

  context "show" do
    it "should show title of the post" do
      visit challenge_path(first)
      page.should have_content(first.name)
    end

    it "should have a working link to edit page" do
      visit challenge_path(first)
      click_link("Edit this Challenge")
      current_path.should == edit_challenge_path(first)
    end

    it "should have a working link to the challenge root" do
      visit challenge_path(first)
      click_link("Back to Challenges Home")
      current_path.should == challenges_path
    end
  end

end