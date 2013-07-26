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