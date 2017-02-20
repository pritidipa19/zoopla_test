require 'watir-webdriver'
require 'cucumber'
require 'selenium-webdriver'
require 'minitest/autorun'


When(/^i am on zoopla registration page$/) do
  @browser.link(:text,"Sign in").when_present.click
  @browser.link(:id,"signin_register_tab_register").when_present.click
  @browser.text_field(:id,"register_email").wait_until_present
end

When(/^i can enter valid email and password$/) do
  email = "#{(0...8).map { (65 + rand(26)).chr }.join}@gmail.com"
  @browser.text_field(:id,"register_email").set email
   @browser.text_field(:id,"register_email_confirm").set email
  @browser.text_field(:id,"register_password").set "psdfgdeh1"
  @browser.select_list(:id,"sender_property_status").select "I am a first-time buyer"
  @browser.button(:id,"register_submit").click
end
