#Tests for Creating an Event

#person creating an event is an admin
#event page shows all phases

#show events for correct user
#event shows for the correct cohort 
#event displays the correct time, day of the week, 



require 'spec_helper'

describe 'Events' do
	let!(:admin) { FactoryGirl.create(:admin) } 
	context "admin logged in" do
		before(:each) do
			visit root_path
			fill_in 'user[email]',                  with: admin.email
			fill_in 'user[password]',               with: admin.password
			click_button('Sign in')
		end

		it "Shows a logged in staff member the create an event page" do
			page.should have_content('Weekly Events')
		end

		it "Shows a logged in staff member the create an event page" do
			click_link 'Create Event'
			page.should have_content('Add an Event to the Boot Calender')
		end

		it "should create a an event" do
			click_link 'Create Event'
			fill_in 'event[title]',   		with: event.title
			fill_in 'event[description',  with: event.description
			fill_in 'event[url]'          with: event.url
			click_button('Create Event')
		end
		
	end
end


