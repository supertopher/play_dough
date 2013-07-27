require 'spec_helper'

10.times { FactoryGirl.create(:user) }
10.times { FactoryGirl.create(:challenge) }

describe "challenges" do
  let(:challenge) { FactoryGirl.create(:challenge) }
  let(:user)      { FactoryGirl.create(:user)  }

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
      page.should have_content(Challenge.last.description)
    end

  end#end index context

end