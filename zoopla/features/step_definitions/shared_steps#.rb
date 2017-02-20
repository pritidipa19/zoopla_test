And(/^I enter "([^"]*)" into the textfield with id "([^"]*)"$/) do |text_to_fill, text_field_id|
@browser.text_field(:id, text_field_id).when_present.set text_to_fill
end

When(/^I click "([^"]*)" button with id$/) do |button_id|
  @browser.button(:id, button_id).when_present.click
end

Then(/^I should see "([^"]*)" case insensitive message on the browser$/) do |message_text|
  sleep 1
  assert /#{message_text}/i.match(@browser.text) != nil
end


Then(/^I should see "([^"]*)" case sensitive message on the browser$/) do |message_text|
  sleep 1
  assert /#{message_text}/.match(@browser.text) != nil
end