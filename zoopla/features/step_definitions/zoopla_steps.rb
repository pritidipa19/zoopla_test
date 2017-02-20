require 'watir-webdriver'
require 'cucumber'
require 'selenium-webdriver'
require 'minitest/autorun'

Given(/^i am on zoopla home page$/) do
  driver= Watir::Browser.new :firefox
  @browser= driver
  @browser.goto "http://www.zoopla.co.uk/"
end

And(/^i click on For sale button$/) do
  @browser.link(:id, "search-tabs-for-sale").when_present.click
end

Given(/^Given i search for "([^"]*)" bedroom "([^"]*)" in "([^"]*)"  between "([^"]*)" and "([^"]*)"" price range$/) do |bedrooms,property_type,city,min,max|
  @browser.select_list(:id,"beds_min").select bedrooms
  @browser.select_list(:id,"property_type").select property_type
  @browser.text_field(:id,"search-input-location").set city
  @browser.select_list(:id,"forsale_price_min").select min
  @browser.select_list(:id,"forsale_price_max").select max
end

When(/^i click the search button$/) do
  @browser.button(:id,"search-submit").click
end

Then(/^i should be on the result page$/) do
sleep 5
  assert @browser.div(:class,"featured-listing-img").exists? == true
end


And(/^I close the browser$/) do
  @browser.close
end


When(/^i seach for "([^"]*)" on the home page$/) do |city|
  @browser.text_field(:id,"search-input-location").set city
end

Then(/^i should see  "([^"]*)" within autocomplete list$/) do |city|
assert @browser.ul(:class, "ui-autocomplete").li(:index, 0).when_present.text== city
end