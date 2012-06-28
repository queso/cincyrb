Given /^I am on the homepage$/ do
  visit root_path
end

Given /^there has recently been a cincy.rb event$/ do
  step "There is a past event with a topic of: \"Hypermedia APIs\""
  step "the past event had a speaker with the name: \"Steve Klabnik\""
end

When /^I go to past events$/ do
  click_link "Past Events"
end

Then /^I should see a event topic/ do
  page.current_path.should == past_events_path
  page.should have_content "What You Missed"
end

Then /^I should see a section for speakers$/ do
  page.should have_css ".speakers" 
end

Then /^I should see a section for videos$/ do
  page.should have_css ".videos" 
end

Given /^There is a past event with a topic of: "(.*?)"$/ do |topic|
  FactoryGirl.create(:past_event, :topic => topic)
end

Given /^the past event had a speaker with the name: "(.*?)"$/ do |name|
  event = PastEvent.first
  FactoryGirl.create(:speaker, :name => name, :past_events => [event])
end

Then /^I should see the topic: "(.*?)"$/ do |topic|
  page.should have_content topic 
end

Then /^I should see a speaker with the name: "(.*?)"$/ do |name|
  page.should have_content name 
end
