
 require_relative  './UserAccountPage'
require_relative  './CreditMyAccount'

# When(/^I select "([^"]*)" from MTM$/) do |arg1|
#   pending # Write code here that turns the phrase above into concrete actions
# end

Then(/^I should be able to verify profile username is enabled$/) do
  profileUserNameIsEnabled = query(UserAccountPage::PROFILE_USERNAME, :isEnabled).first
  unless profileUserNameIsEnabled == true
    screenshot_and_raise('Profile UserName is not Enabled', :name=> 'profile username')
  end

end

Then(/^I should be able to verify profile since is enabled$/) do
  profileSinceIsEnabled = query(UserAccountPage::PROFILE_SINCE, :isEnabled).first
  unless profileSinceIsEnabled == true
    screenshot_and_raise('Profile Since is not Enabled', :name=> 'profile since')
  end
end

Then(/^I should be able to verify profile location is enabled$/) do
  profileLocationIsEnabled = query(UserAccountPage::PROFILE_LOCATION, :isEnabled).first
  unless profileLocationIsEnabled == true
    screenshot_and_raise('Profile Location is not Enabled', :name=> 'profile location')
  end
end

When(/^user chooses to credit their account$/) do
  tap_when_element_exists(UserAccountPage::ACCOUNT_CREDIT)
  tap_when_element_exists(UserAccountPage::ACCOUNT_CREDIT_POPUP_OK)
  #puts query(CreditMyAccount::ACCOUNT_BALANCE, :text)
end

When(/^user chooses to see their feedback$/) do
  tap_when_element_exists(UserAccountPage::FEEDBACK)
end

When(/^user chooses to manage their notifications$/) do
  tap_when_element_exists(UserAccountPage::MANAGE_NOTIFICATIONS)
end

When(/^user chooses to contact us$/) do
  tap_when_element_exists(UserAccountPage::CONTACT_US)
end

When(/^user chooses to log out$/) do
  tap_when_element_exists(UserAccountPage::LOG_OUT)
end
